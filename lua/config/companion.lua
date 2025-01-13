local config = require("codecompanion.config")
local log = require("codecompanion.utils.log")
local actions = require("codecompanion.helpers.actions")

-- define some additional, locally scoped auxillary functions

local M = {}

-- Function to get .SPEC.md content from the root directory of a git project
function M.get_git_md_content(filename)
    -- Get the root directory of the current git repository
    local git_root = vim.fn.system('git rev-parse --show-toplevel')
    -- remove blank lines
    git_root = string.gsub(git_root, "%s+$", "")
    -- Check if the command was successful and the output is not empty
    if vim.v.shell_error == 0 and git_root ~= '' then
        -- construct and normalize path to the file
        local target_path = vim.fs.normalize(git_root .. '/' .. filename)
        -- Check if the .SPEC.md file exists
        if vim.fn.filereadable(target_path) == 1 then
            -- Read the content of the .SPEC.md file
            local lines = vim.fn.readfile(target_path)
            -- Join the lines into a single string and return it
            return table.concat(lines, '\n')
        end
    end
    log:warn(filename .. " does not exist in the git root directory.")
    return ''
end

function M.build_project_context()
  local spec_text = M.get_git_md_content("SPEC.md")
  if #spec_text > 0 then
    spec_text = "<project_specification>\n" .. spec_text .. "\n" .. "</project_specification>\n"
  end
  local readme_text = M.get_git_md_content("README.md")
  if #readme_text > 0 then
    readme_text = "<project_readme>\n" .. readme_text .. "\n" .. "</project_readme>\n"
  end
  local joint_text = readme_text .. "\n" .. spec_text
  return "### Project Context\n\nSome additional context from project documentation is provided below."
  .. " The project specification text is given between `<project_specification>...</project_specification>`"
  .. " tags, while the project's README file is given between `<project_readme>...</project_readme>` tags.\n"
  .. joint_text
end

require("codecompanion").setup(
  {
    strategies = {
      chat = {
        adapter = "ollama",
        slash_commands = {
          ["buffer"] = {
            opts = { provider = "telescope" }
          },
          ["file"] = {
            opts = { provider = "telescope" }
          }
        }
      },
      inline = {
        adapter = "ollama"
      }
    },
    adapters = {
      ollama = function()
        return require("codecompanion.adapters").extend("ollama", {
          name = "qwen2.5-coder",
          schema = {
            model = {
              default = "qwen2.5-coder:7b-instruct-q5_K_S"
            },
            num_ctx = {
              default = 64000
            }
          },
        })
      end,
    },
    display = {
      action_palette = {
        provider = "telescope"
      }
    },
    prompt_library = {
      ["Prompt with project context"] = {
        strategy = "chat",
        description = "Prompts the model including context from README/SPEC.md files in the git root directory.",
        opts = {
          is_slash_cmd = true,
          auto_submit = false,
          short_name = "with_context",
          modes = { "v", "n" },
          user_prompt = false,
          contains_code = true,
        },
        prompts = {
          {
            role = config.constants.SYSTEM_ROLE,
            content = function(context)
              local prompt_text = "You are a senior " .. context.filetype .. " developer"
              .. " who has been asked to complete a specific task within a broader project."
              .. " You may be given some documentation about the project in the form of"
              .. " project README contents and/or a specification that describes what"
              .. " the project attempts to do and how it functions. If you are unsure about"
              .. " anything pertaining to the task or the project, you must ask for clarification"
              .. " or say you do not know.\n"
              return prompt_text
            end
          },
          {
            role = config.constants.USER_ROLE,
            content = function(context)
              local project_text = M.build_project_context()
              local code = actions.get_code(context.start_line, context.end_line)
              if #code > 0 then
                code = "### Provided code:\n\n" .. code
              end
              local joint_text = project_text
              if #code > 0 then
                joint_text = joint_text .. "\n" .. code
              end
              return joint_text
            end,
          }
        }
      },
      ["Python docstring"] = {
        strategy = "chat",
        description = "Generate a NumPy style docstring for this function.",
        opts = {
          modes = { "v" },
          short_name = "docstring",
          auto_submit = true,
          stop_context_insertion = true,
          user_prompt = true,
        },
        prompts = {
          {
            role = "system",
            content = function(context)
              return "I want you to act as a senior "
                .. context.filetype
                .. " developer, who has extensive experience in writing concise yet descriptive documentation. You are asked to provide a NumPy style docstring for the code provided, detailing the type hints if provided and reasoning about what the function does step-by-step."
            end,
          },
          {
            role = "user",
            content = function(context)
              local text = require("codecompanion.helpers.actions").get_code(context.start_line, context.end_line)

              return "I have the following code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
            end,
            opts = {
              contains_code = true,
            }
          },
        },
      },
      ["Make PyTest"] = {
        strategy = "workflow",
        description = "Multi-step workflow for generating unit tests with PyTest.",
        opts = {
          modes = { "v" },
          short_name = "code_reason",
          auto_submit = true,
          stop_context_insertion = true,
          user_prompt = true,
        },
        prompts = {
          {
            {
              role = config.constants.SYSTEM_ROLE,
              content = function(context)
                return "### First step:\n\nYou are a principal engineer with many years developing with the Python"
                  .. " programming language. You have been tasked to write unit tests for some code using PyTest,"
                  .. " which we will break up the process into two steps. This is the first step, in which you"
                  .. " will try and infer high-level characteristics about the code, focusing on the following:"
                  .. " what variables are declared, the names of functions and classes, and any branching/flow"
                  .. " control structures are present. The six questions you will answer are provided **after** the"
                  .. " code: your response must follow the same structure as the questions, and you must attempt"
                  .. " to answer every question. If you are unsure about something, do not make it up and instead"
                  .. " ask for clarification, or say you do not know."
              end,
            },
            {
              role = config.constants.USER_ROLE,
              content = function(context)
                local text = actions.get_code(context.start_line, context.end_line)

                return "### Code to generate unit tests for:\n\n"
                  .. "```" .. context.filetype .. "\n"
                  .. text
                  .. "```\n"
                  .. "\n### Questions:\n\n"
                  .. "1. What variables are declared in the code? Variables are generally on the left side of statements with an `=` symbol."
                  .. " An example of this would be `a = 2 + sin(c)`, where `a` is the variable being declared and implicitly assumes that"
                  .. " the variable `c` has already been declared.\n"
                  .. "2. What, if any, flow/branching statements are used in the code? An example of such a statement would be a `for`"
                  .. " loop, or a conditional block would contain `if` and optionally `else` statements. If there are no such statements,"
                  .. " say there are none.\n"
                  .. "3. What, if any, is the name of the functions and/or class in the provided code? If there are no functions or classes"
                  .. " in the code block, say there are none.\n"
                  .. "4. If there are functions, what, if anything, are the arguments and keyword arguments that are accepted? List them"
                  .. " out by their name(s). If there are neither arguments nor keyword arguments, or there are no functions, say there are none.\n"
                  .. "5. If there are functions, what, if anything, is/are being returned by each function? Are they variables, or are they literals?"
                  .. " If a function ends without a return statement, say that the corresponding function returns none.\n"
                  .. "6. Reabstract or transcribe the provided code into pseudocode that distills the core algorithm and logic. In your pseudocode"
                  .. " you should use simple language to express the logic."
              end,
              opts = {
                contains_code = false,
                -- override the default system prompt with our custom one
                ignore_system_prompt = true,
                }
              }
            },
          {
            {
              role = config.constants.USER_ROLE,
              content = function(context)
                return "### Second step:\n\nFrom your answers above, implement one or multiple unit tests written"
                .. " in `pytest` to ensure that the code functions as intended. If you are unsure"
                .. " of the intention behind the code or cannot infer how it should be used, you"
                .. " must ask for clarification. You are encouraged to use `@pytest.parameterize`"
                .. " and other patterns to make the unit test(s) concise yet cover many different"
                .. " cases without repetition. The unit tests should cover the following:\n"
                .. "1. Use `@pytest.parameterize` to test different values for arguments; try different"
                .. " numbers for numeric arguments, or different text lengths for strings.\n"
                .. "2. Include both positive and negative tests: such as instances where exceptions"
                .. " are expected to be triggered.\n"
                .. "3. You should test the holistic behavior of functions if multiple are provided."
                .. " This means you should include tests that test each independent function in isolation,"
                .. " but also include tests that use functions together.\n"
                .. "4. For each test, include docstrings that explain the behavior and intention of the test."
                .. " The docstrings should be sufficiently comprehensive as to let anyone understand why the"
                .. " test exists, and how it works.\n"
                .. "5. Where appropriate, you should consider using the `hypothesis` library to mock data inputs."
              end,
              opts = {
                contains_code = true,
                auto_submit = true,
                ignore_system_prompt = true,
              }
            }
          },
        }
      },
      ["Code reasoning"] = {
        strategy = "workflow",
        description = "Reason about the code you have been given.",
        opts = {
          modes = { "v" },
          short_name = "code_reason",
          auto_submit = true,
          stop_context_insertion = true,
          user_prompt = true,
        },
        prompts = {
          {
            {
              role = config.constants.SYSTEM_ROLE,
              content = function(context)
                return "### First step:\n\nYou are a principal engineer with many years developing in the "
                  .. context.filetype
                  .. " programming language. You have been given some code to help write documentation for,"
                  .. " which we will break up the process into two steps. This is the first step, in which you"
                  .. " will try and infer high-level characteristics about the code, focusing on the following:"
                  .. " what variables are declared, the names of functions and classes, and any branching/flow"
                  .. " control structures are present. The six questions you will answer are provided **after** the"
                  .. " code: your response must follow the same structure as the questions, and you must attempt"
                  .. " to answer every question. If you are unsure about something, do not make it up and instead"
                  .. " ask for clarification, or say you do not know."
              end,
            },
            {
              role = config.constants.USER_ROLE,
              content = function(context)
                local text = actions.get_code(context.start_line, context.end_line)

                return "### Code:\n\n```" .. context.filetype .. "\n" .. text .. "\n```\n\n"
                  .. "### Questions:\n\n"
                  .. "1. What variables are declared in the code? Variables are generally on the left side of statements with an `=` symbol."
                  .. " An example of this would be `a = 2 + sin(c)`, where `a` is the variable being declared and implicitly assumes that"
                  .. " the variable `c` has already been declared.\n"
                  .. "2. What, if any, flow/branching statements are used in the code? An example of such a statement would be a `for`"
                  .. " loop, or a conditional block would contain `if` and optionally `else` statements. If there are no such statements,"
                  .. " say there are none.\n"
                  .. "3. What, if any, is the name of the functions and/or class in the provided code? If there are no functions or classes"
                  .. " in the code block, say there are none.\n"
                  .. "4. If there are functions, what, if anything, are the arguments and keyword arguments that are accepted? List them"
                  .. " out by their name(s). If there are neither arguments nor keyword arguments, or there are no functions, say there are none.\n"
                  .. "5. If there are functions, what, if anything, is/are being returned by each function? Are they variables, or are they literals?"
                  .. " If a function ends without a return statement, say that the corresponding function returns none.\n"
                  .. "6. Reabstract or transcribe the provided code into pseudocode that distills the core algorithm and logic."
              end,
              opts = {
                contains_code = true,
                ignore_system_prompt = true,
                }
              }
            },
          {
            {
              role = config.constants.USER_ROLE,
              content = function(context)
                return "From your answers above, describe at a high-level what the code does."
                .. " You must use simple language to do so, and be as comprehensive as possible."
                .. " Try and make educated inferences on how the code should be used, and identify"
                .. " areas where you could improve it from usability, readability, and computational"
                .. " performance standpoints. If you are unclear about any aspect of the code, you"
                .. " must **now** ask for clarification."
              end,
              opts = {
                contains_code = true,
                auto_submit = true,
                ignore_system_prompt = true,
              }
            }
          },
        }
      },
    },
  }
)


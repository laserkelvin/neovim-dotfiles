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
  },
  }
)


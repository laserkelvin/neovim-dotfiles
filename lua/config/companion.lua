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


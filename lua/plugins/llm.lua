return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "ollama",
            model = "gemma3:4b-it-qat",
          },
        },
      },
      prompt_library = {
        markdown = {
          dirs = {
            "~/.config/nvim/prompts",
          },
        },
      },
    },
    lazy = false,
    keys = {},
  },
}

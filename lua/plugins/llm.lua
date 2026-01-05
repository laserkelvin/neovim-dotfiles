return {
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    cmd = { "CodeCompanion", "CodeCompanionChat", "CodeCompanionActions" },
    opts = {
      interactions = {
        chat = {
          adapter = {
            name = "ollama",
            model = "ministral-3:8b",
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
  },
  {
    "Davidyz/VectorCode",
    version = "*",
    build = "uv tool install vectorcode && uv tool install upgrade vectorcode",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
}

return {
  {
    "tris203/precognition.nvim",
    config = {
      startVisible = true,
      showBlankVirtLine = true,
    },
  },
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    opts = {},
  },
  {
    "2kabhishek/nerdy.nvim",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-telescope/telescope.nvim",
    },
    cmd = "Nerdy",
  },
  {
    "saghen/blink.cmp",
    ---@module 'blink.cmp',
    ---@type blink.cmp.Config
    opts = {
      sources = {
        default = { "codecompanion" },
        providers = {
          codecompanion = {
            name = "CodeCompanion",
            module = "codecompanion.providers.completion.blink",
            enabled = true
          }
        }
      }
    }
  }
}

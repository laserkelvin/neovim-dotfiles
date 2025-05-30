local zettel_home = vim.fn.expand("~/Documents/zettelkasten")
local config_root = vim.fn.expand("~/.config/nvim")

return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    enabled = false,
    lazy = true,
    config = function()
      require("telekasten").setup({
        home = zettel_home, -- Put the name of your notes directory here
        template_new_daily = config_root .. "/" .. "templates/daily.md",
        template_new_weekly = config_root .. "/" .. "templates/weekly.md",
        templates = config_root .. "/" .. "templates/",
      })
    end,
  },
  {
    "renerocksai/calendar-vim",
    enabled = false
  },
}

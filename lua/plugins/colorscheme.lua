return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = { flavour = "macchiato" },
  },
  {
    "nyoom-engineering/oxocarbon.nvim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
  },
  {
    "craftzdog/solarized-osaka.nvim",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },
  { "EdenEast/nightfox.nvim" }, -- lazy
  {
    "LazyVim/LazyVim",
    opts = {
    --- This is where it actually gets set!
      colorscheme = "rose-pine",
    },
  },
}

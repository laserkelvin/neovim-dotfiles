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
    "rebelot/kanagawa.nvim",
    name = "kanagawa",
  },
  { "EdenEast/nightfox.nvim" }, -- lazy
  {
    "LazyVim/LazyVim",
    opts = {
    --- This is where it actually gets set!
      colorscheme = "dayfox",
    },
  },
}

return {
	"ellisonleao/gruvbox.nvim",
	{
		"nvim-treesitter/nvim-treesitter", tag = "v0.8.1",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"bash",
				"help",
				"html",
				"json", 
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"regex",
				"vim",
				"yaml",
				"julia"
			},
			context_commentstring = { enable = true, enable_autocmd = false },
			highlight = { enable = true },
			indent = { enable = true },
		},
	},
	{"folke/zen-mode.nvim", config = function()
	    require("zen-mode").setup {}
	  end
  },
  "folke/twilight.nvim"
}

return {
	{"neoclide/coc.nvim", tag = "v0.0.81", pin = true},
	{"fannheyward/coc-pyright", build = "npm install -g pyright"},
	{"mrded/nvim-lsp-notify", config = function()
		require("lsp-notify").setup({
			notify = require("notify"),
		})
	end
},
}

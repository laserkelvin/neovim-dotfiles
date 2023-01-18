-- Sets comma as the leader modifier
vim.g.mapleader = ","

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
"plugins", {
	checker = {enabled = false},
	change_detection = {
		notify=false,
	},
	performance = {
		rtp = {
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			}
		},
	},
})
-- activate notify
vim.notify = require("notify")

-- activate lualine
require("lualine").setup()

-- activate nvim-surround
require("nvim-surround").setup()

-- activate leap.nvim
require("leap").add_default_mappings()

-- activate indent_blankline
require("indent_blankline").setup({ show_current_context = true })

-- activate project.nvim
require("project_nvim").setup()

-- activate noice
require("noice").setup()

require("config.bindings")
require("config.languages")
require("config.theme")
require("config.globals")
require("config.doge")
require("config.telescope")
require("config.autocmd")
require("config.git")


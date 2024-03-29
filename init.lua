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

-- configure treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "c", "lua", "python", "markdown", "markdown_inline", "yaml", "json", "vim", "regex", "help", "bash" },
    sync_installed = false,
    auto_install = true
})

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

-- activate aerial.nvim for symbols
require("aerial").setup({
    on_attach = function(bufnr)
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", {buffer = bufnr})
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", {buffer = bufnr})
    end
})

-- activate nvim-tree
require("nvim-tree").setup(
    {
        sort_by = "case_sensitive",
        view = { adaptive_size = true },
        filters = { dotfiles = true },
    }
)

-- activate autopairs
require("nvim-autopairs").setup {
    enable_check_bracket_line = false
}

require("config.bindings")
require("config.languages")
require("config.theme")
require("config.globals")
require("config.doge")
require("config.telescope")
require("config.autocmd")
require("config.git")


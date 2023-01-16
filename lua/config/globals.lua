
local set = vim.opt

set.number = true

-- stuff for coc compatibility
set.updatetime = 300
set.signcolumn = 'yes'

-- Save undo history
vim.o.undofile = true
vim.wo.number = true

-- Case insensitive searching unless /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Set tabs and whatnot for all files
set.softtabstop = 4
set.shiftwidth = 4
set.expandtab = true

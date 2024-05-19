-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Leader>d", "<cmd>DogeGenerate numpy<cr>")
vim.keymap.set("n", "<Leader>tk", "<cmd>Telekasten panel<cr>")
vim.keymap.set("n", "<Leader>tg", "<cmd>Telekasten search_notes<cr>")
vim.keymap.set("n", "<Leader>tz", "<cmd>Telekasten follow_link<cr>")
vim.keymap.set("n", "<Leader>tn", "<cmd>Telekasten new_note<cr>")
vim.keymap.set("n", "<Leader>tb", "<cmd>Telekasten show_backlinks<cr>")
vim.keymap.set("n", "<Leader>td", "<cmd>Telekasten toggle_todo<cr>")
vim.keymap.set("i", "[[", "<cmd>Telekasten insert_link<CR>")
vim.keymap.set("n", "<Leader>zm", "<cmd>ZenMode<cr>")

-- replaces word under cursor
vim.keymap.set("n", "<Leader>x", "*``cgn")

-- emojis and symbols
vim.keymap.set("n", "<Leader>em", "<cmd>Telescope symbols<cr>")

-- markdown preview
vim.keymap.set("n", "<Leader>pr", "<cmd>MarkdownPreview<cr>")

-- nerdicons
vim.keymap.set("n", "<Leader>en", "<cmd>Nerdy<cr>")

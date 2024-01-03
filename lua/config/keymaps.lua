-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Leader>d", "<cmd>DogeGenerate numpy<cr>")
vim.keymap.set("n", "<Leader>tk", "<cmd>Telekasten panel<cr>")
vim.keymap.set("n", "<Leader>tg", "<cmd>Telekasten search_notes<cr>")
vim.keymap.set("n", "<Leader>tz", "<cmd>Telekasten follow_link<cr>")
vim.keymap.set("n", "<Leader>tn", "<cmd>Telekasten new_note<cr>")
vim.keymap.set("n", "<Leader>tb", "<cmd>Telekasten show_backlinks<cr>")
vim.keymap.set("n", "<Leader>zm", "<cmd>ZenMode<cr>")

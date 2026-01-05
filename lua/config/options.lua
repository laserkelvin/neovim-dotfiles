-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- specify LSP related stuff; could be separated
-- out into separate files but this is simple enough for now
vim.g.lazyvim_python_lsp = "" -- change to ty if wanted
vim.g.lazyvim_python_ruff = "" -- change to ruff if wanted
vim.lsp.enable("ruff")
vim.diagnostic.config({
  virtual_lines = {
    current_line = true,
  },
  virtual_text = { current_line = false },
  severity_sort = true,
  update_in_insert = true,
  underline = false,
})
vim.o.winborder = "rounded"

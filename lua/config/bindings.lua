
local map = vim.keymap
local builtin = require("telescope.builtin")

-- General neovim bindings
map.set("i", "<C-o>", "\n", { silent = true, noremap = true })

-- Telescope bindings
map.set("n", "<leader>ff", builtin.find_files, {})
map.set("n", "<leader>fb", builtin.buffers, {})
map.set("n", "<leader>fh", builtin.help_tags, {})
map.set("n", "<leader>ts", ":Telescope<CR>", {})
map.set("n", "<leader>tk", ":Telescope keymaps<CR>", {})

-- Telescope extension bindings
map.set("n", "<space>tb", ":Telescope file_browser<CR>", { noremap = true})
map.set("n", "<space>tf", ":Telescope frecency<CR>", { noremap = true})
map.set("n", "<space>tp", ":Telescope projects<CR>", { noremap = true})

-- Fugitive bindings
map.set("n", "<leader>gg", ":Git<CR>")
map.set("n", "<leader>ga", ":Git add .<enter>")
map.set("n", "<leader>gc", ":Git commit<CR>")
map.set("n", "<leader>gca", ":Git commit --amend<CR>")
map.set("n", "<leader>gcv", ":Git commit --no-verify<CR>")
map.set("n", "<leader>gcs", ":Git commit -s<CR>")
map.set("n", "<leader>gcas", ":Git commit -s --amend<CR>")

-- Coc bindings
map.set("n", "gd", "<Plug>(coc-definition)", { silent = true})
map.set("n", "gy", "<Plug>(coc-type-definition)", { silent = true})
map.set("n", "gi", "<Plug>(coc-implementation)", { silent = true})
map.set("n", "gr", "<Plug>(coc-references)", { silent = true})

map.set("n", "[g", "<Plug>(coc-diagnostic-prev)", { silent = true})
map.set("n", "]g", "<Plug>(coc-diagnostic-next)", { silent = true})

-- Zen mode
map.set("n", "<leader>z", ":ZenMode<CR>", { silent = true})

-- Gitsigns
map.set({"n", "v"}, "<leader>hs", ":Gitsigns stage_hunk<CR>")
map.set({"n", "v"}, "<leader>hr", ":Gitsigns reset_hunk<CR>")

-- Doge comment generation
map.set("n", "<leader>dg", ":DogeGenerate<CR>", { silent = true, noremap = true })

-- nvim-tree
map.set("n", "<leader>tr", ":NvimTreeToggle<CR>", { silent = true, noremap = true})

-- aerial.nvim open
map.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")

-- barbar
map.set("n", "<A-,>", ":BufferPrevious<CR>", { silent = true, noremap = true})
map.set("n", "<A-.>", ":BufferNext<CR>", { silent = true, noremap = true})
map.set("n", "<A-1>", ":BufferGoto 1<CR>", { silent = true, noremap = true})
map.set("n", "<A-2>", ":BufferGoto 2<CR>", { silent = true, noremap = true})
map.set("n", "<A-3>", ":BufferGoto 3<CR>", { silent = true, noremap = true})
map.set("n", "<A-4>", ":BufferGoto 4<CR>", { silent = true, noremap = true})
map.set("n", "<A-5>", ":BufferGoto 5<CR>", { silent = true, noremap = true})
map.set("n", "<A-6>", ":BufferGoto 6<CR>", { silent = true, noremap = true})
map.set("n", "<A-7>", ":BufferGoto 7<CR>", { silent = true, noremap = true})
map.set("n", "<A-8>", ":BufferGoto 8<CR>", { silent = true, noremap = true})
map.set("n", "<A-9>", ":BufferGoto 9<CR>", { silent = true, noremap = true})
map.set("n", "<A-0>", ":BufferLast<CR>", { silent = true, noremap = true})
map.set("n", "<A-c>", ":BufferClose<CR>", { silent = true, noremap = true})
map.set("n", "<A-C>", ":BufferCloseAllButCurrent<CR>", { silent = true, noremap = true})

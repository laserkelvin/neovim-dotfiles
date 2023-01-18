
local map = vim.keymap
local builtin = require("telescope.builtin")

-- Telescope bindings
map.set("n", "<leader>ff", builtin.find_files, {})
map.set("n", "<leader>fb", builtin.buffers, {})
map.set("n", "<leader>fh", builtin.help_tags, {})
map.set("n", "<leader>ts", ":Telescope<CR>", {})
map.set("n", "<leader>tk", ":Telescope keymaps<CR>", {})

-- Telescope extension bindings
map.set("n", "<space>tb", ":Telescope file_browser<CR>", { noremap = true})
map.set("n", "<space>tf", ":Telescope frecency<CR>", { noremap = true})

-- Fugitive bindings
map.set("n", "<leader>gg", ":Git<CR>")
map.set("n", "<leader>ga", ":Git add .<enter>")
map.set("n", "<leader>gc", ":Git commit<CR>")
map.set("n", "<leader>gca", ":Git commit --amend<CR>")

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

-- barbar; too lazy to port this to lua lol
vim.cmd [[
	nnoremap <silent>    <A-,> <Cmd>BufferPrevious<CR>
	nnoremap <silent>    <A-.> <Cmd>BufferNext<CR>
	" Re-order to previous/next
	nnoremap <silent>    <A-<> <Cmd>BufferMovePrevious<CR>
	nnoremap <silent>    <A->> <Cmd>BufferMoveNext<CR>
	" Goto buffer in position...
	nnoremap <silent>    <A-1> <Cmd>BufferGoto 1<CR>
	nnoremap <silent>    <A-2> <Cmd>BufferGoto 2<CR>
	nnoremap <silent>    <A-3> <Cmd>BufferGoto 3<CR>
	nnoremap <silent>    <A-4> <Cmd>BufferGoto 4<CR>
	nnoremap <silent>    <A-5> <Cmd>BufferGoto 5<CR>
	nnoremap <silent>    <A-6> <Cmd>BufferGoto 6<CR>
	nnoremap <silent>    <A-7> <Cmd>BufferGoto 7<CR>
	nnoremap <silent>    <A-8> <Cmd>BufferGoto 8<CR>
	nnoremap <silent>    <A-9> <Cmd>BufferGoto 9<CR>
	nnoremap <silent>    <A-0> <Cmd>BufferLast<CR>
	" Pin/unpin buffer
	nnoremap <silent>    <A-p> <Cmd>BufferPin<CR>
	" Close buffer
	nnoremap <silent>    <A-c> <Cmd>BufferClose<CR>
	" Wipeout buffer
	"                          :BufferWipeout
	" Close commands
	"                          :BufferCloseAllButCurrent
	"                          :BufferCloseAllButPinned
	"                          :BufferCloseAllButCurrentOrPinned
	"                          :BufferCloseBuffersLeft
	"                          :BufferCloseBuffersRight
	" Magic buffer-picking mode
	nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
	" Sort automatically by...
	nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
	nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
	nnoremap <silent> <Space>bl <Cmd>BufferOrderByLanguage<CR>
	nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>
]]


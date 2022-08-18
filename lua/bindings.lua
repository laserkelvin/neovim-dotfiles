
local map = vim.keymap

-- NERDTree bindings
map.set('n', '<C-e>', ':NERDTreeFocus<CR>')
map.set('n', '<C-n>', ':NERDTree<CR>')
map.set('n', '<C-t>', ':NERDTreeToggle<CR>')

-- fzf
map.set('n', '<C-f>', ':Files<CR>')

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

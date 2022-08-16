call plug#begin()
" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" NerdTree
Plug 'preservim/nerdtree'

" nerdtree-git-plugin - show git status in NERD Tree
" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" Telescope stuff
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

" Git stuff
Plug 'tpope/vim-fugitive'

" Visual stuff
" vim-airline
" Enhanced statusline
" https://github.com/vim-airline/vim-airline
Plug 'vim-airline/vim-airline'
" https://github.com/vim-airline/vim-airline-themes
Plug 'vim-airline/vim-airline-themes'
" Notification lol
Plug 'rcarriga/nvim-notify'
" Theme
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" for tab management
Plug 'romgrk/barbar.nvim'

" Markdown plugins
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'elzr/vim-json'

" Autocompletion stuff
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Python autocompletion
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
" Run black on save to format code
Plug 'sbdchd/neoformat'
" Pylint for static code checking
Plug 'neomake/neomake'

" Initialize plugin system
call plug#end()

" Base nvim configurations
"
set number
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
" configurations
"
" NerdTree bindings
nnoremap <C-e> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>

nnoremap <C-f> :Files<CR>

let g:deoplete#enable_at_startup = 1

let g:python3_host_prog = '/scratch/users/kinlongk/miniconda3/bin/python'

" Theme stuff
let g:airline_theme = 'deus'

" NOTE: If barbar's option dict isn't created yet, create it
let bufferline = get(g:, 'bufferline', {})
" disable icons for barbar
let bufferline.icons = v:false

" Python pipeline stuff
" Configure black format on save for Python
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat python black
augroup END


" Use Pylint for static checking
let g:neomake_python_enabled_makers = ['pylint']

colorscheme tokyonight

" bindings for barbar
" Move to previous/next
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

" Distraction free Goyo pairing with Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" disable header folding
let g:vim_markdown_folding_disabled = 1

" do not use conceal feature, the implementation is not so good
let g:vim_markdown_conceal = 0

" disable math tex conceal feature
let g:tex_conceal = ""
let g:vim_markdown_math = 1

" support front matter of various format
let g:vim_markdown_frontmatter = 1  " for YAML format
let g:vim_markdown_toml_frontmatter = 1  " for TOML format
let g:vim_markdown_json_frontmatter = 1  " for JSON format

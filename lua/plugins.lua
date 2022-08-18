local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- 
Plug 'junegunn/vim-easy-align'

-- Navigation, filesystem, explorer
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

-- Telescope; TODO migrate to this instead of fzf
-- Plug 'nvim-lua/plenary.nvim'
-- Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

-- Git and SC related stuff
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-fugitive'

-- Visual, syntax highlighting
Plug('nvim-treesitter/nvim-treesitter', {['do'] = 'TSUpdate'})
Plug('folke/tokyonight.nvim', {['branch'] = 'main'})
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rcarriga/nvim-notify'
Plug 'romgrk/barbar.nvim'

-- Language specific stuff; Markdown
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'elzr/vim-json'

-- Language server, code completion, formatting
Plug('neoclide/coc.nvim', {['branch'] = 'release'})
Plug('pappasam/coc-jedi', {['do'] = 'yarn install --frozen-lockfile && yarn build', ['branch'] =  'main'})
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
Plug 'neomake/neomake'
Plug 'kylechui/nvim-surround'

vim.call('plug#end')

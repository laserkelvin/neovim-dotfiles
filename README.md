# Neovim dotfiles

## Plugins for writing and coding

This is a small dotfile collection for writing and coding in NeoVim. Packages
are managed using [`lazy.nvim`](https://github.com/folke/lazy.nvim), which
is required before these plugins can be used.

The highlights are:

1. `coc-pyright` for autocompletion, with `coc.nvim` as a language server
2. `telescope` for a lot of things
3. `fugitive` for Git control within Neovim
4. `barbar` for buffer management
5. `zenmode` for distraction-free writing
6. `aerial.nvim` for symbol navigation
7. `treesitter` for language highlighting, etc.
8. `NERDComment` for easy line commenting
9. `vim-doge` for docstring generation

## Installation

These dotfiles depend on Lazy.nvim, which in turn as of the latest commit, needs
`nvim>=0.8.0`. The easiest way to setup is grab a binary from the repository and
add it to `PATH`.

### Dependencies

- `npm` (see below in `coc.nvim`), and install the following with `npm` too:
    - `pyright`
    - `neovim`

Additional PyPI packages which are supported, but generally better left for `pre-commit`
workflows:

- `neovim`
- `pylint`
- `isort`
- `black`

The nice thing about Lazy.nvim, apart from being very fast, is that the plugin
management is very automated. `lua/plugins/*.lua` correspond to categories of
plugins, and more or less can be easily configured based on what's there already.

### `coc.nvim`

You will need to first install node JS; the recommended way is to install Node Version Manager
(`nvm`), which simplifies getting node.JS and `npm`.

```bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
```

This will append to `.bashrc`, and so either source or relogin. Afterwards, run `nvm install --lts`
to get the latest LTS version of `npm`.

The suite now uses `coc-pyright`; as `lazy.nvim` installs packages it will install `pyright`
with `npm`. Additionally, run `:CocInstall coc-pyright coc-json coc-yaml` within neovim after everything else
is said and done.

For additional functionality with `noice`, you'll also need to install some specific
`tree-sitter` parsers: `vim regex lua bash markdown markdown_inline python`.

## Usage

### Navigation

- Open files in new buffers with Telescope: in command mode, `<space>fb`
- Close buffers with `:bd`
- Navigate between buffers with `<A-,>` and `<A-.>` (alt-key)
- Open Telescope with `<leader>ts` to access various functions
- Use `leap` to do fast fuzzy search + navigation in a document

### Fugitive

- Get in the habit of using Fugitive for `git` actions:
    - `:Git` without other commands will open a buffer with modified files
    - You can cycle through modified files with `(` and `)`
    - Pressing `=` on a modified file will expand it, showing diffs
    - Pressing `-` on a diff will add the patch

### Commenting & documentation

- Use `vim-doge` for bulk of docstring generation, particularly for Python (`<leader>d`)
- Use `NERDComment` for fast, multiline commenting out of blocks (`<leader>c<space>`)
- Use CoC for a lot of semantic navigation (not sure if that's the phrasing for this)
    - `gd` for go to definition
    - `gr` for find references
    - `gi` for go to implementation
    - `]g` and `[g` for next CoC diagnostic

### Bindings

Use `<space>tk` to open up the Telescope keymap list.

- `<space>tb` for `:Telescope file_browser`
- `<space>tf` for `:Telescope frecency`
- `<leader>ga` for `:Git add .`
- `<leader>gc>` for `:Git commit`
- `<leader>hs` for stage hunk `:Gitsigns stage_hunk<CR>`
- `<leader>hr` for stage hunk `:Gitsigns reset_hunk<CR>`
- `<leader>tr` for `nvim-tree` toggling
- `ysiw(` will enclose text with a bracket; character can be swapped out for anything
    - `ysiW(` will also enclose contiuguous characters, i.e. `hello_world`
- `<leader>a` for `aerial.nvim`, which shows a sidebar with functions/classes. 
    - `{` and `}` will navigate between symbols when this sidebar is open.
- Some useful misc bindings:
    - `<C-x>` will split new buffers horizontally, `<C-v>` vertically
    - In normal mode, `<C-w>s` will split the pane horizontally, `<C-w>v` vertically.

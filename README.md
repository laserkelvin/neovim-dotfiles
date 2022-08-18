# Neovim dotfiles

## Plugins for writing and coding

This is a small dotfile collection for writing and coding in NeoVim. Packages
are managed using [`vim-plugin`](https://github.com/junegunn/vim-plug), which
is required before these plugins can be used.

The highlights are:

1. `coc-jedi` for autocompletion, with `coc.nvim` as a language server
2. `NERDTree` for file navigation
3. `fzf` for fuzzy file finding
4. `fugitive` for Git control within Neovim
5. `barbar` for buffer management
6. `Goyo` and `Limelight` for distraction-free writing


## Installation

Some of the plugins in the config require external packages: `jedi` and
`deoplete`, for example, need Python 3. I generally use Anaconda with Python 3,
and the following commands work for me:

```bash
pip install neovim pep8 flake8 pyflakes pylint isort black
```

Afterwards, just run `:PlugInstall` in a NeoVim session.

### `coc.nvim`

You will need to first install node JS; from the `coc.nvim` instructions, run:

```bash
curl -sL install-node.vercel.app/lts | bash
```

While `coc-jedi` is included in `init.vim`, I'm not sure if you need to still
run `CocInstall coc-jedi` - it works if you do.



# Neovim dotfiles

## Plugins for writing and coding

This is a small dotfile collection for writing and coding in NeoVim. Packages
are managed using [`vim-plugin`](https://github.com/junegunn/vim-plug), which
is required before these plugins can be used.

The highlights are:

1. `jedi` and `deoplete` for syntax highlighting and autocompletion
2. `NERDTree` for file navigation
3. `fzf` for fuzzy file finding
4. `fugitive` for Git control within Neovim
5. `barbar` for buffer management
6. `Goyo` and `Limelight` for distraction-free writing


## Installation

Some of the plugins in the config require external packages: `jedi` and
`deoplete`, for example, need Python 3. I generally use Anaconda with Python 3,
and the following commands work for me:

`pip install neovim pep8 flake8 pyflakes pylint isort black`

First setup Vundle by following the instructions on git, making sure to adapt
it for installation on NeoVim. On Linux, the config files are generally found
in \$HOME/.config/nvim/

Afterwards, just run `:PlugInstall` in a NeoVim session.


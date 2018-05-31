# Academic vim

## Plugins for writing and coding

This is a small dotfile collection for writing and coding in NeoVim.
Packages are managed using `Vundle`, which is required before these
plugins can be used.

I've taken a lot of snippets from a very nice NeoVim config that can
be found here: http://nvim.fisadev.com/
I've taken the modules and settings that I've liked and spliced it
into this config.

The highlights are:

1. Goyo + Limelight for distraction-free writing
2. Airline
3. Markdown packages such as `tabular` and `vim-markdown`
4. LaTeX integration with `vimtex`, `vim-latex`, and `neotex`
5. Integration with Pandoc with `vim-pandoc` and `vim-pandoc-syntax`
6. Color scheme integration with `PyWal`
7. `jedi` and `deoplete` for syntax highlighting and autocompletion
8. Markdown tables with `vim-table-mode`

## Installation

Some of the plugins in the config require external packages: `jedi` and
`deoplete`, for example, need Python 3. I generally use Anaconda with Python 3,
and the following commands work for me:

`pip install neovim pep8 flake8 pyflakes pylint isort`

First setup Vundle by following the instructions on git, making sure to adapt
it for installation on NeoVim. On Linux, the config files are generally found
in \$HOME/.config/nvim/

Afterwards, just run `:PluginInstall` in a NeoVim session.

If things don't work out, you may have to run `:UpdateRemotePlugins`

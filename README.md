# Neovim dotfiles

## Plugins for writing and coding

This is a small dotfile collection for writing and coding in NeoVim. Packages
are managed using [`lazy.nvim`](https://github.com/folke/lazy.nvim), which
is required before these plugins can be used.

The highlights are:

1. `coc-jedi` for autocompletion, with `coc.nvim` as a language server
2. `telescope` for a lot of things
3. `fugitive` for Git control within Neovim
4. `barbar` for buffer management
5. `Goyo` and `Limelight` for distraction-free writing


## Installation

These dotfiles depend on Lazy.nvim, which in turn as of the latest commit, needs
`nvim>=0.8.0`. The easiest way to setup is grab a binary from the repository and
add it to `PATH`.

Some of the plugins in the config require external packages: `jedi` and
`deoplete`, for example, need Python 3. I generally use Anaconda with Python 3,
and the following commands work for me:

```bash
pip install neovim pep8 flake8 pyflakes pylint isort black
```

The nice thing about Lazy.nvim, apart from being very fast, is that the plugin
management is very automated. `lua/plugins/*.lua` correspond to categories of
plugins, and more or less can be easily configured based on what's there already.

### `coc.nvim`

You will need to first install node JS; from the `coc.nvim` instructions, run:

```bash
curl -sL install-node.vercel.app/lts | bash
```

While `coc-jedi` is included in `init.vim`, I'm not sure if you need to still
run `CocInstall coc-jedi` - it works if you do.


## Usage

### Fugitive

- Get in the habit of using Fugitive for `git` actions:
	- `:Git` without other commands will open a buffer with modified files
	- You can cycle through modified files with `(` and `)`
	- Pressing `=` on a modified file will expand it, showing diffs
	- Pressing `-` on a diff will add the patch

# Neovim-setup

Personal set up for Neovim v 0.11.x on macOs and Arch Linux systems.

## Requirements

### Hombrew(macOS)
Follows the instruction of the [Hombrew site](https://brew.sh/)

### NodeJS

To use a Node version manager, like [fnm](https://github.com/Schniz/fnm)
Then install the Neovim node support package,

```bash
npm install -g neovim
```

### Python
For Python, makes sure to set up the provider using a virtualenv, follows the following steps,

Installs `pyenv` and `pyenv-virtualenv`, run on mac `brew install pyenv pyenv-virtualenv`

```sh
pyenv install <python-version>
pyenv virtualenv <python-version> py3nvim
pyenv activate py3nvim
python -m pip install pynvim neovim
pyenv which python  # save the path
```

Go to `./lua/diegognt/options.lua` and assign the python path to the `vim.g.python3_host_prog` field.

### Rust
- On macOS run, `brew install rust`
- On Arch, `sudo pacman -S rust`

### Stylua

This a Lua formatter, to install it run,

```bash
cargo install stylua
```
>Note: Make sure to follow the post-installation instruction.

### fd

- On macOS run, `brew install fd`
- On Arch run, `sudo pacman -S fd`

### ripgrep

- On macOS run, `brew install ripgrep`
- On Arch run, `sudo pacman -S ripgrep`

## Set up

1. Clone the repo

```bash
git clone https://github.com/diegognt/neovim-setup.git neovim-setup
```
2. Go to the directory.

```bash
cd neovim-setup
```
3. Run:

```bash
ln -s "$(pwd)" `/.config/nvim
```

## Special thanks
- [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) For all the guidance and inspiration.


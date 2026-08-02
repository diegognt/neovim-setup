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
ln -s "$(pwd)" ~/.config/nvim
```
## Code Companion Configuration

The plugin `codecompanion.nvim` is configured in `lua/coding/code-companion.lua`. It sets up the Antigravity CLI (`agy`) as the default agent for Chat commands. The configuration includes:

- Agent name `antigravity` with command `agy`.
- Keybindings:
  - `<leader>ad` to fix diagnostics via `#{diagnostics}` prompt.
  - `<leader>ap` to open a prompt for custom queries.
- The CLI interaction uses the `terminal` provider.

Ensure that the `agy` CLI is installed and available in your PATH for the plugin to function correctly.


## Special thanks
- [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) For all the guidance and inspiration.


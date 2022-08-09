# Neovim-setup
Personal set up for Neovim on macOS & Ubuntu.

## Requirements
### Hombrew(macOS)
Follows the instruction of the [Hombrew site](https://brew.sh/)
### NodeJS
To use a Node version manager, like [fnm](https://github.com/Schniz/fnm)
Then install the Neovim node support package,
~~~bash
npm install -g neovim
~~~
### Python
To use a Python version manager, like [Pyenv](https://github.com/pyenv/pyenv)
Then install the Neovim node support package,
~~~bash
pip install pynvim
~~~
### Rust
On macOS run,
~~~bash
brew install rust
~~~
On Ubuntu follow the steps on the following [page](https://www.rust-lang.org/learn/get-started)
### Stylua
This a Lua formatter, to install it run,
~~~bash
cargo install stylua
~~~
>Note: Make sure to follow the post-installation instruction.
### Lazygit
This a Git UI for terminals, to install it on macOS run,
~~~bash
brew install Lazygit
~~~
To install it on Ubuntu follow the instructions on the following [page](https://github.com/jesseduffield/lazygit#manual)
### Neovim(obviously)
On macOS run
~~~bash
brew install neovim
~~~
On Ubuntu just build the 0.7.x version, check the [github page](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source) for instructions.
## Set up
1. Clone the repo
~~~bash
git clone https://github.com/diegognt/neovim-setup.git neovim-setup
~~~
2. Go to the directory.
~~~bash
cd neovim-setup
~~~
3. Run:
~~~bash
ln -s "$(pwd)" ~/.config/nvim
~~~
## Considerations
- When using Iterm, go to `Profiles` > `Keys` and remap the `Right Option Key` to "Esc+". 
## Special thanks
- [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) For all the guidance and inspiration.


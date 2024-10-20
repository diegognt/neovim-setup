# Neovim-setup
Personal set up for Neovim v 0.10.x on macOS & Ubuntu.

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
Build the 0.10.x version, check the [Github page](https://github.com/neovim/neovim/wiki/Installing-Neovim#install-from-source) for instructions.

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

### Python
For Python, makes sure to set up the provider using a virtualenv, follows the following steps,

Installs `pyenv` and `pyenv-virtualenv`, run on mac `brew install pyenv pyenv-virtualenv`

~~~sh
pyenv install <python-version>
pyenv virtualenv <python-version> py3nvim
pyenv activate py3nvim
python -m pip install pynvim neovim
pyenv which python  # save the path
~~~

Go to `./lua/diegognt/options.lua` and assign the python path to the `vim.g.python3_host_prog` field.

## Considerations

- When using Iterm, go to `Profiles` > `Keys` and remap the `Right Option Key` to "Esc+". 

### AI

#### Github Copilot
- Once copilot is running, run :Copilot auth to start the authentication process.

#### ChatGPT
- Make sure you have `curl` installed.
- Set environment variable called `$OPENAI_API_KEY` which you can [obtain here](https://beta.openai.com/account/api-keys).
- `<lead>A a` command which opens a prompt selection from [Awesome ChatGPT Prompts](https://github.com/f/awesome-chatgpt-prompts) to be used with the `gpt-3.5-turbo` model.

## Special thanks
- [Neovim from scratch](https://github.com/LunarVim/Neovim-from-scratch) For all the guidance and inspiration.


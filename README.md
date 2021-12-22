# neovim-setup
Personal set up for Neovim on macOS.

## Requirements
### Hombrew
Follows the instruction of the [Hombrew site](https://brew.sh/)
### NodeJS
Run,
~~~bash
brew install node
~~~
**Note:** Is recommended to use a Node version manager, like [fnm](https://github.com/Schniz/fnm)
Then install the neovim node support package,
~~~bash
npm install -g neovim
~~~
###Python
TBD
### Neovim(obviously)
Run
~~~bash
brew install neovim
~~~

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
1. When using Iterm, go to `Profiles` > `Keys` and remap the `Right Option Key` to "Esc+". 

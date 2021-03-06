-- For this set up Packer is used as the plugin manager

local fn = vim.fn

-- Automatically install packer
-- 'fn.stdpath' is the following path '.local/share/nvim/'
local install_path = fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path,
  }
  print 'Installing packer close and reopen Neovim...'
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require('packer.util').float { border = 'rounded' }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use 'wbthomason/packer.nvim' -- Have packer manage itself
  use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'kyazdani42/nvim-web-devicons' -- Nice icons
  use 'folke/twilight.nvim' -- Focus on code stuff
  use 'windwp/nvim-autopairs' -- Autopairs plugin with treesitter and cmp
  use 'numToStr/Comment.nvim' -- Comments make it easy
  use 'akinsho/bufferline.nvim' -- Bufferline plugin
  use 'moll/vim-bbye' -- Plugin to avoid close nvim when close a buffer
  use 'akinsho/toggleterm.nvim' --Nice Terminal for nvim
  use 'lukas-reineke/indent-blankline.nvim' -- Nice indentation
  use 'ahmedkhalf/project.nvim' -- Cool projects/workspaces manager
  use 'goolord/alpha-nvim' -- A simple greeter screen with style
  use 'lewis6991/impatient.nvim'
  use 'folke/todo-comments.nvim' -- Fancy TODO manager

  -- File Explorer
  use 'kyazdani42/nvim-tree.lua' -- Nvim file explorer

  -- Tselescope
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-project.nvim'

  -- Colorschemes
  use 'folke/tokyonight.nvim'
  use 'rebelot/kanagawa.nvim'

  --Completion plugins
  use 'hrsh7th/nvim-cmp' -- The completion plugin
  use 'hrsh7th/cmp-buffer' -- The buffer completions plugin extension
  use 'hrsh7th/cmp-path' -- The path completions plugin extension
  use 'hrsh7th/cmp-cmdline' -- The cmdline completions plugin extension
  use 'saadparwaiz1/cmp_luasnip' -- The LuaSnip completions plugin extension
  use 'hrsh7th/cmp-nvim-lsp' -- The LSP completion plugin extension
  use 'hrsh7th/cmp-nvim-lua' -- The Lua language completion plugin extension

  -- Snippets
  use 'L3MON4D3/LuaSnip' -- A snippet engine
  use 'rafamadriz/friendly-snippets' -- A bunch of snippets to use

  -- Language Server Protocol - LSP
  use 'neovim/nvim-lspconfig' -- Enables LSP
  use 'williamboman/nvim-lsp-installer' -- A language server installer
  use 'jose-elias-alvarez/null-ls.nvim' -- null-ls
  use 'folke/trouble.nvim' -- Elegant diagnostic tools for LSP
  use 'RRethy/vim-illuminate' -- Highlighting words occurance

  -- TreeSitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }
  use 'p00f/nvim-ts-rainbow' -- Better parentheses rainbow using treesitter
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-treesitter/nvim-tree-docs'
  use 'windwp/nvim-ts-autotag'

  -- Git stuff
  use 'lewis6991/gitsigns.nvim'

  -- Status line.
  use 'nvim-lualine/lualine.nvim'

  use 'folke/which-key.nvim' -- Keymap helper

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require('packer').sync()
  end
end)

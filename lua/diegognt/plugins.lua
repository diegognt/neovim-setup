-- For this set up Packer is used as the plugin manager

local fn = vim.fn

-- Autoinstall LazyVim if not installed
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, 'lazy')
if not status_ok then
  vim.notify('LazyVim is not installed')
  return
end

-- Install your plugins here
return lazy.setup({
  -- My plugins here
  'nvim-lua/popup.nvim', -- An implementation of the Popup API from vim in Neovim
  'nvim-lua/plenary.nvim', -- Useful lua functions used ny lots of plugins
  'kyazdani42/nvim-web-devicons', -- Nice icons
  'folke/twilight.nvim', -- Focus on code stuff
  'windwp/nvim-autopairs', -- Autopairs plugin with treesitter and cmp
  'numToStr/Comment.nvim', -- Comments make it easy
  'akinsho/bufferline.nvim', -- Bufferline plugin
  'moll/vim-bbye', -- Plugin to avoid close nvim when close a buffer
  'akinsho/toggleterm.nvim', --Nice Terminal for nvim
  'lukas-reineke/indent-blankline.nvim', -- Nice indentation
  'ahmedkhalf/project.nvim', -- Cool projects/workspaces manager
  'goolord/alpha-nvim', -- A simple greeter screen with style
  'lewis6991/impatient.nvim',
  'folke/todo-comments.nvim', -- Fancy TODO manager
  'danymat/neogen', -- Doc annotation

  -- File Explorer
  'kyazdani42/nvim-tree.lua', -- Nvim file explorer

  -- Tselescope
  'nvim-telescope/telescope.nvim',
  'nvim-telescope/telescope-project.nvim',

  -- Colorschemes
  'folke/tokyonight.nvim',
  'rebelot/kanagawa.nvim',
  'EdenEast/nightfox.nvim',

  --Completion plugins
  {
    'hrsh7th/nvim-cmp', -- The completion plugin
    dependencies = {
      'hrsh7th/cmp-buffer', -- The buffer completions plugin extension
      'hrsh7th/cmp-path', -- The path completions plugin extension
      'hrsh7th/cmp-cmdline', -- The cmdline completions plugin extension
      'saadparwaiz1/cmp_luasnip', -- The LuaSnip completions plugin extension
      'hrsh7th/cmp-nvim-lsp', -- The LSP completion plugin extension
      'hrsh7th/cmp-nvim-lua', -- The Lua language completion plugin extension
    },
  },
  -- Snippets
  'L3MON4D3/LuaSnip', -- A snippet engine
  'rafamadriz/friendly-snippets', -- A bunch of snippets to use

  -- Language Server Protocol - LSP
  {
    'neovim/nvim-lspconfig', -- Enables LSP
    dependencies = {
      'williamboman/mason.nvim', -- Manager
      'williamboman/mason-lspconfig.nvim', -- LSP adapter for Mason
      'jose-elias-alvarez/null-ls.nvim', -- null-ls
      'jayp0521/mason-nvim-dap.nvim', -- Install the required tools for adapters
      'folke/trouble.nvim', -- Elegant diagnostic tools for LSP
      'RRethy/vim-illuminate', -- Highlighting words occurance
    },
  },
  -- TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = function()
      pcall(require('nvim-treesitter.install').update({ with_sync = true }))
    end,
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'p00f/nvim-ts-rainbow', -- Better parentheses rainbow using treesitter
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/nvim-tree-docs',
      'windwp/nvim-ts-autotag',
    },
  },
  -- Git stuff
  'lewis6991/gitsigns.nvim',

  -- Status line.
  'nvim-lualine/lualine.nvim',

  'folke/which-key.nvim', -- Keymap helper

  -- Debugger Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      'rcarriga/nvim-dap-ui',
      'theHamsta/nvim-dap-virtual-text',
      'leoluz/nvim-dap-go', -- GO adapter
      'mfussenegger/nvim-dap-python', -- Python adapter
      'mxsdev/nvim-dap-vscode-js', -- JS/TS adapter
    },
  },
})

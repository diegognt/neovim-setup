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
  -- Plugin to avoid close nvim when close a buffer
  {
    'moll/vim-bbye',
    event = 'VeryLazy',
  },
  'akinsho/toggleterm.nvim', --Nice Terminal for nvim
  'lewis6991/impatient.nvim',
  -- Fancy TODO manager
  {
    'folke/todo-comments.nvim',
    cmd = { 'TodoTrouble' },
    event = { 'BufReadPost', 'BufNewFile' },
    config = true,
  },
  'danymat/neogen', -- Doc annotation
  -- Bufferline plugin
  {
    'akinsho/bufferline.nvim',
    event = 'VeryLazy',
    opts = require('diegognt.bufferline'),
    config = function(_, opts)
      require('bufferline').setup(opts)
    end,
  },
  -- ui components
  {
    'MunifTanjim/nui.nvim',
    lazy = true,
  },
  -- A simple greeter screen with style
  {
    'goolord/alpha-nvim',
    event = 'VimEnter',
    opts = function()
      local opts = require('diegognt.greeter')
      return opts.dashboard
    end,
    config = function(_, dashboard)
      require('alpha').setup(dashboard.opts)
    end,
  },
  -- Nice icons
  {
    'kyazdani42/nvim-web-devicons',
    lazy = true,
  },
  -- Focus on code stuff
  {
    'folke/twilight.nvim',
    lazy = true,
  },
  -- Nice indentation
  {
    'echasnovski/mini.indentscope',
    dependencies = {
      'echasnovski/mini.nvim',
    },
    version = '*',
    event = { 'BufReadPre', 'BufNewFile' },
    opts = require('diegognt.indentation'),
    config = function(_, opts)
      require('mini.indentscope').setup(opts)
    end,
  },
  -- Auto pairs
  {
    'echasnovski/mini.pairs',
    event = 'VeryLazy',
    config = function(_, opts)
      require('mini.pairs').setup(opts)
    end,
  },
  -- Notifications
  {
    'folke/noice.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
      'rcarriga/nvim-notify',
    },
    opts = require('diegognt.notifications'),
    event = 'VeryLazy',
  },
  -- File Explorer
  {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    branch = 'v2.x',
    dependencies = {
      'nvim-lua/plenary.nvim', -- Useful lua functions used by lots of plugins
    },
    config = {
      follow_current_file = true,
      hide_dotfiles = false,
      hijack_netrw_behavior = 'open_current',
      filesystem = {
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = true,
        },
      },
    },
  },
  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    cmd = 'Telescope',
    version = false,
    dependencies = {
      'nvim-telescope/telescope-project.nvim',
    },
  },

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
    event = 'InsertEnter',
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
      -- Highlighting words occurance
      {
        'RRethy/vim-illuminate',
        lazy = true,
      },
    },
  },
  -- Elegant diagnostic tools for LSP
  {
    'folke/trouble.nvim',
    cmd = { 'Trouble' },
    opts = { use_diagnostic_signs = true },
  },
  -- TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      { 'nvim-treesitter/nvim-treesitter-textobjects' },
      {
        'JoosepAlviste/nvim-ts-context-commentstring',
        lazy = true,
      },
      { 'nvim-treesitter/playground' },
      { 'nvim-treesitter/nvim-treesitter-refactor' },
      { 'windwp/nvim-ts-autotag' },
    },
    opts = require('diegognt.treesitter'),
    config = function(_, opts)
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'echasnovski/mini.comment',
    event = 'VeryLazy',
    opts = {
      hooks = {
        pre = function()
          require('ts_context_commentstring.internal').update_commentstring({})
        end,
      },
    },
    config = function(_, opts)
      require('mini.comment').setup(opts)
    end,
  },

  -- AI
  {
    'Bryley/neoai.nvim',
    dependencies = {
      'MunifTanjim/nui.nvim',
    },
    cmd = {
      'NeoAI',
      'NeoAIOpen',
      'NeoAIClose',
      'NeoAIToggle',
      'NeoAIContext',
      'NeoAIContextOpen',
      'NeoAIContextClose',
      'NeoAIInject',
      'NeoAIInjectCode',
      'NeoAIInjectContext',
      'NeoAIInjectContextCode',
    },
    keys = {
      { '<leader>as', desc = 'summarize text' },
      { '<leader>ag', desc = 'generate git message' },
    },
    config = function()
      local options = require('diegognt.ai')
      require('neoai').setup(options)
    end,
  },
  {
    'zbirenbaum/copilot.lua',
    build = ':Copilot auth',
    event = 'InsertEnter',
    config = function()
      require('copilot').setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          keymap = {
            accept = '<A-Right>',
            next = '<A-Down>',
            prev = '<A-Up>',
            dismiss = '<A-d>',
          },
        },
      })
    end,
  },
  -- Git stuff
  {
    'lewis6991/gitsigns.nvim',
    event = 'BufRead',
  },

  -- Status line.
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = function()
      local opts = require('diegognt.lualine')
      return opts
    end,
    config = function(_, opts)
      require('lualine').setup(opts)
    end,
  },

  -- Keymap helper
  {
    'folke/which-key.nvim',
    event = 'VeryLazy',
    opts = function()
      local opts = require('diegognt.whichkey')
      return opts
    end,
    config = function(_, opts)
      local whichkey = require('which-key')
      whichkey.setup(opts.opts)
      whichkey.register(opts.mappings, opts.mappings_opts)
    end,
  },

  -- Debugger Adapter Protocol
  {
    'mfussenegger/nvim-dap',
    dependencies = {
      {
        'rcarriga/nvim-dap-ui',
        opts = {},
        config = function(_, opts)
          local dap = require('dap')
          local dapui = require('dapui')
          dapui.setup(opts)
          dap.listeners.after.event_initialized['dapui_config'] = function()
            dapui.open({})
          end
          dap.listeners.before.event_terminated['dapui_config'] = function()
            dapui.close({})
          end
          dap.listeners.before.event_exited['dapui_config'] = function()
            dapui.close({})
          end
        end,
      },
      -- DAP virtual text
      {
        'theHamsta/nvim-dap-virtual-text',
        opts = {},
      },
      -- Mason integration with DAP
      {
        'jay-babu/mason-nvim-dap.nvim',
        dependencies = 'mason.nvim',
        cmd = { 'DapInstall', 'DapUninstall' },
        opts = {
          -- Makes a best effort to setup the various debuggers with
          -- reasonable debug configurations
          automatic_setup = true,
          -- You can provide additional configuration to the handlers,
          -- see mason-nvim-dap README for more information
          handlers = {},
          -- You'll need to check that you have the required things installed
          -- online, please don't ask me how to install them :)
          ensure_installed = {
            -- Update this to ensure that you have the debuggers for the langs you want
          },
        },
      },
    },
    event = 'VeryLazy',
  },
})

local icons = require "diegognt.icons"
local Spec = {
  "nvim-telescope/telescope.nvim",
  cmd = "Telescope",
  version = false,
  lazy = true,
}

function Spec.config()
  local actions = require "telescope.actions"
  local whichkey = require "which-key"

  whichkey.register {
    ["<leader>Sc"] = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
    ["<leader>SM"] = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
    ["<leader>Sr"] = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
    ["<leader>Sk"] = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
    ["<leader>SC"] = { "<cmd>Telescope commands<CR>", "Commands" },
    ["<leader>St"] = { "<cmd>TodoTelescope<CR>", "TODOs" },
  }

  require("telescope").setup {
    defaults = {
      prompt_prefix = icons.ui.Telescope .. " ",
      selection_caret = icons.ui.Forward .. " ",
      entry_prefix = "   ",
      initial_mode = "insert",
      selection_strategy = "reset",
      path_display = { "smart" },
      color_devicons = true,
      set_env = { ["COLORTERM"] = "truecolor" },
      sorting_strategy = nil,
      layout_strategy = nil,
      layout_config = {},
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--smart-case",
        "--hidden",
        "--glob=!.git/",
      },
      mappings = {
        i = {
          ["<C-n>"] = actions.cycle_history_next,
          ["<C-p>"] = actions.cycle_history_prev,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["<esc>"] = actions.close,
          ["j"] = actions.move_selection_next,
          ["k"] = actions.move_selection_previous,
          ["q"] = actions.close,
        },
      },
    },
    pickers = {
      live_grep = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },
      find_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      git_files = {
        theme = "dropdown",
        previewer = false,
        hidden = true,
      },
      buffers = {
        theme = "dropdown",
        previewer = false,
        initial_mode = "normal",
        mappings = {
          i = {
            ["<C-d>"] = actions.delete_buffer,
          },
          n = {
            ["dd"] = actions.delete_buffer,
          },
        },
      },
      planets = {
        show_pluto = true,
        show_moon = true,
      },
      colorscheme = {
        enable_preview = true,
      },
      lsp_references = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_definitions = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_declarations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
      lsp_implementations = {
        theme = "dropdown",
        initial_mode = "normal",
      },
    },
  }
end

return Spec

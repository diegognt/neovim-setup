return {
  'saghen/blink.cmp',
  dependencies = 'rafamadriz/friendly-snippets',
  version = '*',
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono',
    },
    completion = {
      menu = {
        border = "rounded",
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ '/', '?' }, vim.fn.getcmdtype())
        end,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = { border = "rounded" }
      },
    },
    signature = { window = { border = "rounded" } },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
      providers = {
      },
    },
  },
  opts_extend = { "sources.default" }
}

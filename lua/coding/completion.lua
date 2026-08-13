return {
  "saghen/blink.cmp",
  dependencies = {
    "saghen/blink.lib",
    "rafamadriz/friendly-snippets",
    { "moyiz/blink-emoji.nvim" },
  },
  build = function()
    require("blink.cmp").build():pwait()
  end,
  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = "enter" },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = "mono",
    },
    snippets = {
      preset = "default",
    },
    completion = {
      menu = {
        border = "rounded",
        auto_show = function(ctx)
          return ctx.mode ~= "cmdline" or not vim.tbl_contains({ "/", "?" }, vim.fn.getcmdtype())
        end,
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 250,
        treesitter_highlighting = true,
        window = { border = "rounded" },
      },
    },
    signature = { enabled = true, window = { border = "rounded" } },
    sources = {
      default = { "lsp", "path", "snippets", "buffer" },
      providers = {
        emoji = {
          module = "blink-emoji",
          name = "Emoji",
          score_offset = 15, -- Tune by preference
          opts = { insert = true }, -- Insert emoji (default) or complete its name
        },
      },
      per_filetype = {
        codecompanion = { "codecompanion" },
        markdown = { "lsp", "path", "snippets", "buffer" },
        inline_markdown = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
  opts_extend = { "sources.default" },
}

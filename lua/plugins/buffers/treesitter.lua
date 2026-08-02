-- globals parser for syntax highlighting
local parsers = require "globals.treesitter"

return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter").install(parsers)
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          lookahead = true, -- Automatically jump forward to textobj
          selection_modes = {
            ["@parameter.outer"] = "v", -- charwise
            ["@function.outer"] = "V", -- linewise
            ["@class.outer"] = "V", -- linewise
          },
        },
      })

      local ts_select = require "nvim-treesitter-textobjects.select"

      -- Map your specific text objects
      local function ts_key_map_select(mode, key, query_string, query_group)
        vim.keymap.set(mode, key, function()
          ts_select.select_textobject(query_string, query_group or "textobjects")
        end)
      end

      -- Functions
      ts_key_map_select({ "x", "o" }, "af", "@function.outer")
      ts_key_map_select({ "x", "o" }, "if", "@function.inner")

      -- Classes
      ts_key_map_select({ "x", "o" }, "at", "@class.outer")
      ts_key_map_select({ "x", "o" }, "it", "@class.inner")

      -- Calls
      ts_key_map_select({ "x", "o" }, "ac", "@call.outer")
      ts_key_map_select({ "x", "o" }, "ic", "@call.inner")

      -- Parameters
      ts_key_map_select({ "x", "o" }, "aa", "@parameter.outer")
      ts_key_map_select({ "x", "o" }, "ia", "@parameter.inner")

      -- Loops
      ts_key_map_select({ "x", "o" }, "al", "@loop.outer")
      ts_key_map_select({ "x", "o" }, "il", "@loop.inner")

      -- Conditionals
      ts_key_map_select({ "x", "o" }, "ai", "@conditional.outer")
      ts_key_map_select({ "x", "o" }, "ii", "@conditional.inner")

      -- Comments
      ts_key_map_select({ "x", "o" }, "a/", "@comment.outer")
      ts_key_map_select({ "x", "o" }, "i/", "@comment.inner")

      -- Blocks
      ts_key_map_select({ "x", "o" }, "ab", "@block.outer")
      ts_key_map_select({ "x", "o" }, "ib", "@block.inner")

      -- Statements/Scopes
      ts_key_map_select({ "x", "o" }, "as", "@statement.outer")
      ts_key_map_select({ "x", "o" }, "is", "@scopename.inner")

      -- Attributes/Frames (assuming these exist in your parsers)
      ts_key_map_select({ "x", "o" }, "aA", "@attribute.outer")
      ts_key_map_select({ "x", "o" }, "iA", "@attribute.inner")
      ts_key_map_select({ "x", "o" }, "aF", "@frame.outer")
      ts_key_map_select({ "x", "o" }, "iF", "@frame.inner")
    end,
  },
}

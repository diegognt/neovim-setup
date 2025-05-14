-- Sets a custom keymap.
-- @param mode "i"|"n"|"v"|"x"|"t"|"c" A Vim mode
-- @param keymap string The keymap
-- @param action string|function An action to execute
-- @params opts Table A table of options
local set_keymap = function(mode, keymap, action, opts)
  local mode_opts = {
    n = { noremap = true, silent = true },
    t = { silent = true },
    i = {},
    v = {},
    x = {},
    c = {},
  }

  opts = vim.tbl_deep_extend("force", mode_opts[mode], opts or {})

  vim.keymap.set(mode, keymap, action, opts)
end

local Globals = {
  keymaps = {
    set = set_keymap,
  },
  paths = {
    python_bin = "~/.pyenv/versions/py3nvim/bin/python",
  },
}

return Globals

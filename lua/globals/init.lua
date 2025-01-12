-- Sets a custom keymap.
-- @param mode "i"|"n"|"v"|"x"|"t"|"c" A Vim mode
-- @param keymap string The keymap
-- @param action string|function An action to execute
-- @param desc? string A description of the keymap
local set_keymap = function(mode, keymap, action, desc)
  desc = desc or nil
  local opts = {
    n = { noremap = true, silent = true },
    t = { silent = true },
    i = {},
    v = {},
    x = {},
    t = {},
    c = {},
  }

  if desc ~= nil then
    vim.keymap.set(
      mode,
      keymap,
      action,
      vim.tbl_deep_extend("force", opts[mode], { desc = desc })
    )
  else
   vim.keymap.set(mode, keymap, action, opts[mode])
  end
end

local Globals = {
  keymaps = {
    set = set_keymap,
    normal_opts = { noremap = true, silent = true },
    term_opts = { silent = true }
  },
  paths = {
    python_bin = "~/.pyenv/versions/py3nvim/bin/python"
  }
}

return Globals

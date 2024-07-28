local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = LAZY_PLUGIN_SPEC,
  install = {
    colorscheme = { "primer_dark", "habamax" },
  },
  ui = {
    border = "rounded",
  },
  change_detection = {
    enabled = true,
    notify = false,
  },
  checker = { enabled = true },
})

-- Setup nvim-cmp.
local status_ok, indent_blankline = pcall(require, 'indent_blankline')
if not status_ok then
  vim.notify('The `lukas-reineke/indent-blankline.nvim` plugin was not found.')
  return
end

indent_blankline.setup {
  show_end_of_line = true,
  space_char_blankline = " ",
  filetype_exclude = { 'alpha', 'toggleterm' }
}

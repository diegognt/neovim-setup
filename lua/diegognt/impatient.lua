local status_ok, impatient = pcall(require, 'impatient')
if not status_ok then
  vim.notify('The `lewis6991/impatient.nvim` was not found.')
	return
end

impatient.enable_profile()

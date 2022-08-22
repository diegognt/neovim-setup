local status_ok, illuminate = pcall(require, 'illuminate')

if not status_ok then
	vim.notify('The `RRethy/vim-illuminate` plugin was not found.')
	return
end

illuminate.configure({
	-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = { 'alpha', 'NvimTree' }
})

vim.api.nvim_set_keymap(
	'n',
	'<A-n>',
	'<cmd>lua require"illuminate".goto_next_reference{wrap=true}<CR>',
	{ noremap = true }
)
vim.api.nvim_set_keymap(
	'n',
	'<A-p>',
	'<cmd>lua require"illuminate".goto_prev_reference{reverse=true,wrap=true}<CR>',
	{ noremap = true }
)

local status_ok, neogen = pcall(require, 'neogen')

if not status_ok then
	vim.notify('The `danymat/neogen` plugin was not found.')
	return
end

neogen.setup({
	languages = {
		c = {
			template = {
				annotation_convention = 'doxygen',
			},
		},
		lua = {
			template = {
				annotation_convention = 'ldoc',
			},
		},
		javascript = {
			template = {
				annotation_convention = 'jsdoc',
			},
		},
		python = {
			template = {
				annotation_convention = 'google_docstrings',
			},
		},
		typescript = {
			template = {
				annotation_convention = 'jsdoc',
			},
		},
	},
})

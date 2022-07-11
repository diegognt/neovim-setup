local colorscheme = 'tokyonight'

-- Tokyo Night set up
if colorscheme == 'tokyonight' then
	vim.g.tokyonight_italic_functions = true
	vim.g.tokyonight_sidebars = { 'qf', 'vista_kind', 'terminal', 'packer' }
end

if colorscheme == 'kanagawa' then
	require('kanagawa').setup({
		functionStyle = { italic = true },
	})
end

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
	vim.notify('colorscheme ' .. colorscheme .. ' not found!')
	return
end

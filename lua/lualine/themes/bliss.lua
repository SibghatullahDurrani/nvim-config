-- Lualine theme for Bliss colorscheme (Serenity-style grayscale)

local colors = {
	-- Base colors
	base = '#CCCCCC',
	panel = 'NONE',
	fg = '#474747',
	border = '#333333',

	-- Grayscale palette
	black = '#333333',
	gray1 = '#3D3D3D',
	gray2 = '#474747',
	gray3 = '#515151',
	gray4 = '#5B5B5B',
	gray5 = '#656565',
	gray6 = '#6F6F6F',

	bright_black = '#4A4A4A',
	bright_gray1 = '#545454',
	bright_gray2 = '#5E5E5E',
	bright_gray3 = '#686868',
	bright_gray4 = '#727272',
	bright_gray5 = '#7C7C7C',
	bright_gray6 = '#868686',
	bright_white = '#FFFFFF',

	subtle = '#BFBFBF',
	selection_bg = '#333333',
}

return {
	normal = {
		a = { bg = colors.gray4, fg = colors.base, gui = 'bold' },
		b = { bg = colors.panel, fg = colors.fg },
		c = { bg = colors.panel, fg = colors.bright_black },
	},
	insert = {
		a = { bg = colors.gray6, fg = colors.base, gui = 'bold' },
		b = { bg = colors.panel, fg = colors.gray6 },
	},
	visual = {
		a = { bg = colors.gray5, fg = colors.base, gui = 'bold' },
		b = { bg = colors.panel, fg = colors.gray5 },
	},
	replace = {
		a = { bg = colors.gray1, fg = colors.base, gui = 'bold' },
		b = { bg = colors.panel, fg = colors.gray1 },
	},
	command = {
		a = { bg = colors.gray3, fg = colors.base, gui = 'bold' },
		b = { bg = colors.panel, fg = colors.gray3 },
	},
	inactive = {
		a = { bg = colors.panel, fg = colors.bright_black },
		b = { bg = colors.panel, fg = colors.bright_black },
		c = { bg = colors.panel, fg = colors.bright_black },
	},
}

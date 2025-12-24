-- Lualine theme for Osaka Jade colorscheme (Dark green/jade aesthetic)

local colors = {
	-- Base colors
	bg = '#111c18',
	fg = '#C1C497',

	-- Normal colors
	black = '#23372B',
	red = '#FF5345',
	green = '#549e6a',
	yellow = '#459451',
	blue = '#509475',
	magenta = '#D2689C',
	cyan = '#2DD5B7',
	white = '#F6F5DD',

	-- Bright colors
	bright_black = '#53685B',
	bright_red = '#db9f9c',
	bright_green = '#63b07a',
	bright_yellow = '#E5C736',
	bright_blue = '#ACD4CF',
	bright_magenta = '#75bbb3',
	bright_cyan = '#8CD3CB',
	bright_white = '#9eebb3',

	-- UI colors
	selection_bg = '#1f2d25',
	comment = '#53685B',
}

return {
	normal = {
		a = { bg = colors.cyan, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.fg },
		c = { bg = colors.bg, fg = colors.comment },
	},
	insert = {
		a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.green },
	},
	visual = {
		a = { bg = colors.magenta, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.magenta },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.red },
	},
	command = {
		a = { bg = colors.bright_yellow, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.bright_yellow },
	},
	inactive = {
		a = { bg = colors.bg, fg = colors.comment },
		b = { bg = colors.bg, fg = colors.comment },
		c = { bg = colors.bg, fg = colors.comment },
	},
}

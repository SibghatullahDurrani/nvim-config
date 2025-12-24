-- Lualine theme for Hackerman colorscheme (Matrix-style hacker theme)

local colors = {
	-- Base colors
	bg = '#0B0C16',
	fg = '#ddf7ff',

	-- Normal colors
	black = '#0B0C16',
	red = '#50f872',       -- Bright green (matrix style)
	green = '#4fe88f',     -- Cyan-green
	yellow = '#50f7d4',    -- Bright cyan
	blue = '#829dd4',      -- Soft blue
	magenta = '#86a7df',   -- Light blue
	cyan = '#7cf8f7',      -- Bright cyan
	white = '#85E1FB',     -- Light cyan-blue

	-- Bright colors
	bright_black = '#6a6e95',
	bright_red = '#85ff9d',
	bright_green = '#9cf7c2',
	bright_yellow = '#a4ffec',
	bright_blue = '#c4d2ed',
	bright_magenta = '#cddbf4',
	bright_cyan = '#d1fffe',
	bright_white = '#ddf7ff',

	-- UI colors
	selection_bg = '#1a1e2e',
	comment = '#6a6e95',
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
		a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
		b = { bg = colors.selection_bg, fg = colors.yellow },
	},
	inactive = {
		a = { bg = colors.bg, fg = colors.comment },
		b = { bg = colors.bg, fg = colors.comment },
		c = { bg = colors.bg, fg = colors.comment },
	},
}

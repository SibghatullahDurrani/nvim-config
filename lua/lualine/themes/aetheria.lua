-- Lualine theme for Aetheria colorscheme

local colors = {
	-- Base colors
	bg_dark = '#0e091d', -- Very dark blue-purple
	bg_darker = '#061F23', -- Very dark teal-blue
	bg_medium = '#092F34', -- Dark desaturated blue
	bg_light = '#0C3F45', -- Dark muted blue-green

	-- Foreground colors
	fg_bright = '#C8E967', -- Bright yellowish-green
	fg_medium = '#A8D61F', -- Bright yellow-green
	fg_dim = '#8CB319', -- Muted yellow-green

	-- Accent colors
	purple = '#9147a8', -- Dark purple
	red = '#E20342', -- Bright red
	orange = '#FF7F41', -- Bright orange
	cyan = '#04C5F0', -- Bright cyan-blue
	red_vibrant = '#f93d3b', -- Vibrant red
	yellow = '#ffbe74', -- Light orange-yellow
	pink = '#FD3E6A', -- Vibrant pink-red
	green = '#7cd699', -- Light blue-green
}

return {
	normal = {
		a = { bg = colors.purple, fg = colors.bg_dark, gui = 'bold' },
		b = { bg = colors.bg_medium, fg = colors.fg_bright },
		c = { bg = colors.bg_darker, fg = colors.fg_dim },
	},
	insert = {
		a = { bg = colors.cyan, fg = colors.bg_dark, gui = 'bold' },
		b = { bg = colors.bg_medium, fg = colors.cyan },
	},
	visual = {
		a = { bg = colors.pink, fg = colors.bg_dark, gui = 'bold' },
		b = { bg = colors.bg_medium, fg = colors.pink },
	},
	replace = {
		a = { bg = colors.red, fg = colors.bg_dark, gui = 'bold' },
		b = { bg = colors.bg_medium, fg = colors.red },
	},
	command = {
		a = { bg = colors.orange, fg = colors.bg_dark, gui = 'bold' },
		b = { bg = colors.bg_medium, fg = colors.orange },
	},
	inactive = {
		a = { bg = colors.bg_darker, fg = colors.fg_dim },
		b = { bg = colors.bg_darker, fg = colors.fg_dim },
		c = { bg = colors.bg_darker, fg = colors.fg_dim },
	},
}

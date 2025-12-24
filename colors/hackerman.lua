-- Hackerman Neovim theme (Matrix-style hacker theme)
-- Matching terminal colors with cyan/green accents

-- Reset highlighting
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
	vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'hackerman'
vim.o.winblend = 0
vim.o.pumblend = 0

-- Hackerman color palette
local colors = {
	-- Base colors
	bg = '#0B0C16',        -- Very dark blue-black background
	fg = '#ddf7ff',        -- Light cyan-blue foreground

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
	bright_black = '#6a6e95',   -- Muted purple-gray
	bright_red = '#85ff9d',     -- Brighter green
	bright_green = '#9cf7c2',   -- Light green-cyan
	bright_yellow = '#a4ffec',  -- Very bright cyan
	bright_blue = '#c4d2ed',    -- Light blue
	bright_magenta = '#cddbf4', -- Very light blue
	bright_cyan = '#d1fffe',    -- Almost white cyan
	bright_white = '#ddf7ff',   -- Pure white-cyan

	-- UI colors
	cursor = '#ddf7ff',
	cursor_text = '#0B0C16',
	selection_bg = '#1a1e2e',
	comment = '#6a6e95',
	border = '#50f7d4',
}

local function set(g, o)
	vim.api.nvim_set_hl(0, g, o)
end

local P = { bg = colors.bg }

-- Core/editor
set('Normal', vim.tbl_extend('force', { fg = colors.fg }, P))
set('NormalNC', vim.tbl_extend('force', { fg = colors.fg }, P))
set('SignColumn', vim.tbl_extend('force', { fg = colors.cyan }, P))
set('FoldColumn', vim.tbl_extend('force', { fg = colors.cyan }, P))
set('LineNr', vim.tbl_extend('force', { fg = colors.comment }, P))
set('CursorLine', { bg = colors.selection_bg })
set('CursorColumn', { bg = colors.selection_bg })
set('CursorLineNr', { fg = colors.cyan, bold = true })
set('Cursor', { fg = colors.cursor_text, bg = colors.cursor })

-- Floats / menus
set('NormalFloat', vim.tbl_extend('force', { fg = colors.fg }, P))
set('FloatBorder', vim.tbl_extend('force', { fg = colors.border }, P))
set('FloatTitle', { fg = colors.cyan, bg = colors.bg, bold = true })
set('Pmenu', vim.tbl_extend('force', { fg = colors.fg }, { bg = colors.selection_bg }))
set('PmenuSel', { fg = colors.cyan, bg = colors.bg, bold = true })
set('PmenuSbar', { bg = colors.selection_bg })
set('PmenuThumb', { bg = colors.cyan })

-- Statusline / tabs
set('StatusLine', { fg = colors.fg, bg = colors.selection_bg })
set('StatusLineNC', vim.tbl_extend('force', { fg = colors.comment }, P))
set('TabLine', { fg = colors.comment, bg = colors.selection_bg })
set('TabLineFill', P)
set('TabLineSel', vim.tbl_extend('force', { fg = colors.cyan, bold = true }, P))

-- Window separators
set('WinSeparator', vim.tbl_extend('force', { fg = colors.border }, P))
set('VertSplit', vim.tbl_extend('force', { fg = colors.border }, P))

-- Selections / folds
set('Visual', { bg = colors.selection_bg })
set('VisualNOS', { bg = colors.selection_bg })
set('Folded', { fg = colors.comment, bg = colors.selection_bg, italic = true })
set('ColorColumn', { bg = colors.selection_bg })

-- Syntax highlighting
set('Comment', { fg = colors.comment, italic = true })
set('Constant', { fg = colors.yellow })
set('String', { fg = colors.green })
set('Character', { fg = colors.green })
set('Number', { fg = colors.yellow })
set('Boolean', { fg = colors.yellow, bold = true })
set('Float', { fg = colors.yellow })
set('Identifier', { fg = colors.fg })
set('Function', { fg = colors.bright_green, bold = true })
set('Statement', { fg = colors.cyan, bold = true })
set('Conditional', { fg = colors.cyan })
set('Repeat', { fg = colors.cyan })
set('Label', { fg = colors.magenta })
set('Operator', { fg = colors.bright_cyan })
set('Keyword', { fg = colors.cyan, bold = true })
set('Exception', { fg = colors.red })
set('PreProc', { fg = colors.magenta })
set('Include', { fg = colors.magenta })
set('Define', { fg = colors.magenta })
set('Macro', { fg = colors.magenta })
set('PreCondit', { fg = colors.magenta })
set('Type', { fg = colors.blue, italic = true })
set('StorageClass', { fg = colors.blue })
set('Structure', { fg = colors.blue })
set('Typedef', { fg = colors.blue })
set('Special', { fg = colors.bright_yellow })
set('SpecialChar', { fg = colors.bright_yellow })
set('Tag', { fg = colors.cyan })
set('Delimiter', { fg = colors.fg })
set('SpecialComment', { fg = colors.comment, italic = true, bold = true })
set('Debug', { fg = colors.red })
set('Underlined', { underline = true })
set('Error', { fg = colors.red, bold = true })
set('Todo', { fg = colors.cyan, bg = colors.selection_bg, bold = true })
set('Title', { fg = colors.cyan, bold = true })
set('Directory', { fg = colors.blue })

-- Search
set('Search', { fg = colors.bg, bg = colors.cyan })
set('IncSearch', { fg = colors.bg, bg = colors.red, bold = true })
pcall(set, 'CurSearch', { fg = colors.bg, bg = colors.red, bold = true })
set('Substitute', { fg = colors.bg, bg = colors.yellow, bold = true })
set('MatchParen', { fg = colors.bright_yellow, bold = true })
pcall(set, 'HlSearchNear', { fg = colors.bg, bg = colors.cyan })
pcall(set, 'HlSearchLens', { fg = colors.bg, bg = colors.blue })
pcall(set, 'HlSearchLensNear', { fg = colors.bg, bg = colors.cyan })

-- Diagnostics
set('DiagnosticError', { fg = colors.red, bg = colors.bg })
set('DiagnosticWarn', { fg = colors.yellow, bg = colors.bg })
set('DiagnosticInfo', { fg = colors.cyan, bg = colors.bg })
set('DiagnosticHint', { fg = colors.green, bg = colors.bg })
set('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
set('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.yellow })
set('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.cyan })
set('DiagnosticUnderlineHint', { undercurl = true, sp = colors.green })

-- Git signs
set('GitSignsAdd', { fg = colors.green })
set('GitSignsChange', { fg = colors.cyan })
set('GitSignsDelete', { fg = colors.red })

-- LSP highlights
set('LspReferenceText', { bg = colors.selection_bg })
set('LspReferenceRead', { bg = colors.selection_bg })
set('LspReferenceWrite', { bg = colors.selection_bg, underline = true })

-- Treesitter highlights
set('@text', { link = 'Normal' })
set('@comment', { link = 'Comment' })
set('@constant', { link = 'Constant' })
set('@constant.builtin', { fg = colors.yellow, bold = true })
set('@string', { link = 'String' })
set('@character', { link = 'Character' })
set('@number', { link = 'Number' })
set('@boolean', { link = 'Boolean' })
set('@float', { link = 'Float' })
set('@function', { link = 'Function' })
set('@function.builtin', { fg = colors.bright_green, bold = true })
set('@method', { link = 'Function' })
set('@keyword', { link = 'Keyword' })
set('@keyword.function', { link = 'Keyword' })
set('@keyword.operator', { link = 'Operator' })
set('@type', { link = 'Type' })
set('@type.builtin', { fg = colors.blue, bold = true })
set('@variable', { fg = colors.fg })
set('@variable.builtin', { fg = colors.yellow, bold = true, italic = true })
set('@variable.parameter', { fg = colors.white, italic = true })
set('@variable.member', { fg = colors.bright_green })
set('@property', { fg = colors.bright_green })
set('@parameter', { fg = colors.white, italic = true })
set('@tag', { fg = colors.cyan })
set('@tag.attribute', { fg = colors.magenta })
set('@tag.delimiter', { fg = colors.bright_cyan })
set('@constructor', { fg = colors.blue })
set('@namespace', { fg = colors.blue })
set('@module', { fg = colors.blue })
set('@operator', { link = 'Operator' })
set('@punctuation', { fg = colors.bright_cyan })
set('@punctuation.bracket', { fg = colors.bright_cyan })
set('@punctuation.delimiter', { fg = colors.bright_cyan })
set('@punctuation.special', { fg = colors.cyan })
set('@text.uri', { fg = colors.green, underline = true })
set('@text.todo', { fg = colors.cyan, bg = colors.selection_bg, bold = true })

-- Telescope
set('TelescopeBorder', { fg = colors.border })
set('TelescopePromptBorder', { fg = colors.cyan })
set('TelescopeResultsBorder', { fg = colors.green })
set('TelescopePreviewBorder', { fg = colors.yellow })
set('TelescopeSelection', { fg = colors.cyan, bg = colors.selection_bg, bold = true })
set('TelescopeMatching', { fg = colors.bright_yellow, bold = true })

-- nvim-tree
set('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
set('NvimTreeFolderName', { fg = colors.blue })
set('NvimTreeFolderIcon', { fg = colors.cyan })
set('NvimTreeEmptyFolderName', { fg = colors.blue })
set('NvimTreeOpenedFolderName', { fg = colors.blue, bold = true })
set('NvimTreeRootFolder', { fg = colors.cyan, bold = true })
set('NvimTreeGitDirty', { fg = colors.cyan })
set('NvimTreeGitNew', { fg = colors.green })
set('NvimTreeGitDeleted', { fg = colors.red })

-- Terminal colors
vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.bright_black
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_10 = colors.bright_green
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white

-- Enforce background consistency
local function enforce_bg()
	set('Normal', { fg = colors.fg, bg = colors.bg })
	set('NormalNC', { fg = colors.fg, bg = colors.bg })
	set('NormalFloat', { fg = colors.fg, bg = colors.bg })
	set('StatusLine', { fg = colors.fg, bg = colors.selection_bg })
	set('TabLine', { fg = colors.comment, bg = colors.selection_bg })
	pcall(set, 'AlphaNormal', { fg = colors.fg, bg = colors.bg })
end

vim.api.nvim_create_autocmd({ 'UIEnter', 'VimEnter', 'ColorScheme' }, {
	callback = function()
		vim.schedule(enforce_bg)
	end,
})
vim.api.nvim_create_autocmd('User', {
	pattern = 'AlphaReady',
	callback = function()
		vim.schedule(enforce_bg)
	end,
})

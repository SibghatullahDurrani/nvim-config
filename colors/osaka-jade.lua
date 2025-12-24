-- Osaka Jade Neovim theme
-- Dark green/jade aesthetic with warm accents

-- Reset highlighting
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
	vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.g.colors_name = 'osaka-jade'
vim.o.winblend = 0
vim.o.pumblend = 0

-- Osaka Jade color palette
local colors = {
	-- Base colors
	bg = '#111c18',        -- Very dark green-black background
	fg = '#C1C497',        -- Warm beige-yellow foreground

	-- Normal colors
	black = '#23372B',     -- Dark green-gray
	red = '#FF5345',       -- Bright coral red
	green = '#549e6a',     -- Medium jade green
	yellow = '#459451',    -- Greenish yellow
	blue = '#509475',      -- Teal-green
	magenta = '#D2689C',   -- Rose pink
	cyan = '#2DD5B7',      -- Bright turquoise
	white = '#F6F5DD',     -- Warm off-white

	-- Bright colors
	bright_black = '#53685B',   -- Medium green-gray
	bright_red = '#db9f9c',     -- Muted rose
	bright_green = '#63b07a',   -- Brighter jade green
	bright_yellow = '#E5C736',  -- Golden yellow
	bright_blue = '#ACD4CF',    -- Light teal
	bright_magenta = '#75bbb3', -- Light cyan-green
	bright_cyan = '#8CD3CB',    -- Soft cyan
	bright_white = '#9eebb3',   -- Light mint green

	-- UI colors
	cursor = '#D7C995',
	cursor_text = '#000000',
	selection_bg = '#1f2d25',
	comment = '#53685B',
	border = '#2DD5B7',
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
set('Constant', { fg = colors.magenta })
set('String', { fg = colors.green })
set('Character', { fg = colors.green })
set('Number', { fg = colors.bright_yellow })
set('Boolean', { fg = colors.bright_yellow, bold = true })
set('Float', { fg = colors.bright_yellow })
set('Identifier', { fg = colors.fg })
set('Function', { fg = colors.bright_green, bold = true })
set('Statement', { fg = colors.blue, bold = true })
set('Conditional', { fg = colors.blue })
set('Repeat', { fg = colors.blue })
set('Label', { fg = colors.magenta })
set('Operator', { fg = colors.cyan })
set('Keyword', { fg = colors.blue, bold = true })
set('Exception', { fg = colors.red })
set('PreProc', { fg = colors.magenta })
set('Include', { fg = colors.magenta })
set('Define', { fg = colors.magenta })
set('Macro', { fg = colors.magenta })
set('PreCondit', { fg = colors.magenta })
set('Type', { fg = colors.bright_blue, italic = true })
set('StorageClass', { fg = colors.bright_blue })
set('Structure', { fg = colors.bright_blue })
set('Typedef', { fg = colors.bright_blue })
set('Special', { fg = colors.cyan })
set('SpecialChar', { fg = colors.cyan })
set('Tag', { fg = colors.blue })
set('Delimiter', { fg = colors.fg })
set('SpecialComment', { fg = colors.comment, italic = true, bold = true })
set('Debug', { fg = colors.red })
set('Underlined', { underline = true })
set('Error', { fg = colors.red, bold = true })
set('Todo', { fg = colors.bright_yellow, bg = colors.selection_bg, bold = true })
set('Title', { fg = colors.cyan, bold = true })
set('Directory', { fg = colors.bright_blue })

-- Search
set('Search', { fg = colors.bg, bg = colors.bright_yellow })
set('IncSearch', { fg = colors.bg, bg = colors.cyan, bold = true })
pcall(set, 'CurSearch', { fg = colors.bg, bg = colors.cyan, bold = true })
set('Substitute', { fg = colors.bg, bg = colors.green, bold = true })
set('MatchParen', { fg = colors.bright_yellow, bold = true })
pcall(set, 'HlSearchNear', { fg = colors.bg, bg = colors.bright_yellow })
pcall(set, 'HlSearchLens', { fg = colors.bg, bg = colors.blue })
pcall(set, 'HlSearchLensNear', { fg = colors.bg, bg = colors.bright_yellow })

-- Diagnostics
set('DiagnosticError', { fg = colors.red, bg = colors.bg })
set('DiagnosticWarn', { fg = colors.bright_yellow, bg = colors.bg })
set('DiagnosticInfo', { fg = colors.cyan, bg = colors.bg })
set('DiagnosticHint', { fg = colors.green, bg = colors.bg })
set('DiagnosticUnderlineError', { undercurl = true, sp = colors.red })
set('DiagnosticUnderlineWarn', { undercurl = true, sp = colors.bright_yellow })
set('DiagnosticUnderlineInfo', { undercurl = true, sp = colors.cyan })
set('DiagnosticUnderlineHint', { undercurl = true, sp = colors.green })

-- Git signs
set('GitSignsAdd', { fg = colors.green })
set('GitSignsChange', { fg = colors.blue })
set('GitSignsDelete', { fg = colors.red })

-- LSP highlights
set('LspReferenceText', { bg = colors.selection_bg })
set('LspReferenceRead', { bg = colors.selection_bg })
set('LspReferenceWrite', { bg = colors.selection_bg, underline = true })

-- Treesitter highlights
set('@text', { link = 'Normal' })
set('@comment', { link = 'Comment' })
set('@constant', { link = 'Constant' })
set('@constant.builtin', { fg = colors.magenta, bold = true })
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
set('@type.builtin', { fg = colors.bright_blue, bold = true })
set('@variable', { fg = colors.fg })
set('@variable.builtin', { fg = colors.bright_yellow, bold = true, italic = true })
set('@variable.parameter', { fg = colors.bright_red, italic = true })
set('@variable.member', { fg = colors.bright_green })
set('@property', { fg = colors.bright_green })
set('@parameter', { fg = colors.bright_red, italic = true })
set('@tag', { fg = colors.blue })
set('@tag.attribute', { fg = colors.magenta })
set('@tag.delimiter', { fg = colors.cyan })
set('@constructor', { fg = colors.bright_blue })
set('@namespace', { fg = colors.bright_blue })
set('@module', { fg = colors.bright_blue })
set('@operator', { link = 'Operator' })
set('@punctuation', { fg = colors.cyan })
set('@punctuation.bracket', { fg = colors.cyan })
set('@punctuation.delimiter', { fg = colors.cyan })
set('@punctuation.special', { fg = colors.cyan })
set('@text.uri', { fg = colors.green, underline = true })
set('@text.todo', { fg = colors.bright_yellow, bg = colors.selection_bg, bold = true })

-- Telescope
set('TelescopeBorder', { fg = colors.border })
set('TelescopePromptBorder', { fg = colors.cyan })
set('TelescopeResultsBorder', { fg = colors.green })
set('TelescopePreviewBorder', { fg = colors.blue })
set('TelescopeSelection', { fg = colors.cyan, bg = colors.selection_bg, bold = true })
set('TelescopeMatching', { fg = colors.bright_yellow, bold = true })

-- nvim-tree
set('NvimTreeNormal', { fg = colors.fg, bg = colors.bg })
set('NvimTreeFolderName', { fg = colors.bright_blue })
set('NvimTreeFolderIcon', { fg = colors.cyan })
set('NvimTreeEmptyFolderName', { fg = colors.bright_blue })
set('NvimTreeOpenedFolderName', { fg = colors.bright_blue, bold = true })
set('NvimTreeRootFolder', { fg = colors.cyan, bold = true })
set('NvimTreeGitDirty', { fg = colors.blue })
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

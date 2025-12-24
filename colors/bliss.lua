-- Bliss Neovim theme (Serenity-style grayscale)
-- Matching btop-style gray panel

-- Reset highlighting
vim.cmd('highlight clear')
if vim.fn.exists('syntax_on') == 1 then
	vim.cmd('syntax reset')
end

vim.o.termguicolors = true
vim.o.background = 'light'
vim.g.colors_name = 'bliss'
vim.o.winblend = 0
vim.o.pumblend = 0

-- Grayscale color palette
local colors = {
	base = '#CCCCCC', -- terminal base
	panel = 'NONE', -- editor panel, matches btop
	fg = '#474747',
	border = '#333333',

	black = '#333333',
	red = '#3D3D3D',
	green = '#474747',
	yellow = '#515151',
	blue = '#5B5B5B',
	magenta = '#656565',
	cyan = '#6F6F6F',
	white = '#CCCCCC',

	bright_black = '#4A4A4A',
	bright_red = '#545454',
	bright_green = '#5E5E5E',
	bright_yellow = '#686868',
	bright_blue = '#727272',
	bright_magenta = '#7C7C7C',
	bright_cyan = '#868686',
	bright_white = '#FFFFFF',

	subtle = '#BFBFBF',
	selection_bg = '#333333',
	selection_fg = '#CCCCCC',
	cursor = '#333333',
	cursor_text = '#CCCCCC',
}

local function set(g, o)
	vim.api.nvim_set_hl(0, g, o)
end

local P = { bg = colors.panel }

-- Core/editor
set('Normal', vim.tbl_extend('force', { fg = colors.fg }, P))
set('NormalNC', vim.tbl_extend('force', { fg = colors.fg }, P))
set('SignColumn', vim.tbl_extend('force', { fg = colors.bright_black }, P))
set('FoldColumn', vim.tbl_extend('force', { fg = colors.bright_black }, P))
set('LineNr', vim.tbl_extend('force', { fg = colors.bright_black }, P))
set('CursorLine', P)
set('CursorColumn', P)
set('CursorLineNr', { fg = colors.bright_cyan, bold = true })
set('Cursor', { fg = colors.cursor_text, bg = colors.cursor })

-- Floats / menus
set('NormalFloat', vim.tbl_extend('force', { fg = colors.fg }, P))
set('FloatBorder', vim.tbl_extend('force', { fg = colors.border }, P))
set('FloatTitle', { fg = colors.blue, bg = colors.panel, bold = true })
set('Pmenu', vim.tbl_extend('force', { fg = colors.fg }, P))
set('PmenuSel', { fg = colors.base, bg = colors.blue, bold = true })
set('PmenuSbar', { bg = colors.subtle })
set('PmenuThumb', { bg = colors.green })

-- Statusline / tabs
set('StatusLine', vim.tbl_extend('force', { fg = colors.fg }, P))
set('StatusLineNC', vim.tbl_extend('force', { fg = colors.bright_black }, P))
set('TabLine', vim.tbl_extend('force', { fg = colors.bright_black }, P))
set('TabLineFill', P)
set('TabLineSel', { fg = colors.base, bg = colors.blue, bold = true })

-- Window separators
set('WinSeparator', vim.tbl_extend('force', { fg = colors.border }, P))
set('VertSplit', vim.tbl_extend('force', { fg = colors.border }, P))

-- Selections / folds
set('Visual', { bg = colors.selection_bg, fg = colors.selection_fg })
set('VisualNOS', { bg = colors.subtle })
set('Folded', vim.tbl_extend('force', { fg = colors.bright_black, italic = true }, P))
set('ColorColumn', { bg = colors.selection_bg })

-- Syntax highlighting
set('Comment', { fg = colors.bright_black, italic = true })
set('Constant', { fg = colors.magenta })
set('String', { fg = colors.green })
set('Character', { fg = colors.cyan })
set('Number', { fg = colors.yellow })
set('Boolean', { fg = colors.red, bold = true })
set('Float', { fg = colors.yellow })
set('Identifier', { fg = colors.fg })
set('Function', { fg = colors.blue, bold = true })
set('Statement', { fg = colors.magenta, bold = true })
set('Conditional', { fg = colors.magenta })
set('Repeat', { fg = colors.yellow })
set('Label', { fg = colors.cyan })
set('Operator', { fg = colors.cyan })
set('Keyword', { fg = colors.blue, bold = true })
set('Exception', { fg = colors.red })
set('PreProc', { fg = colors.yellow })
set('Include', { fg = colors.yellow })
set('Define', { fg = colors.yellow })
set('Macro', { fg = colors.bright_red })
set('PreCondit', { fg = colors.yellow })
set('Type', { fg = colors.cyan, italic = true })
set('StorageClass', { fg = colors.red })
set('Structure', { fg = colors.yellow })
set('Typedef', { fg = colors.yellow })
set('Special', { fg = colors.cyan })
set('SpecialChar', { fg = colors.cyan })
set('Tag', { fg = colors.magenta })
set('Delimiter', { fg = colors.fg })
set('SpecialComment', { fg = colors.bright_black, italic = true, bold = true })
set('Debug', { fg = colors.red })
set('Underlined', { underline = true })
set('Error', { fg = colors.red, bold = true })
set('Todo', { fg = colors.base, bg = colors.yellow, bold = true })
set('Title', { fg = colors.blue, bold = true })
set('Directory', { fg = colors.cyan })

-- Search
set('Search', { fg = colors.base, bg = '#8C8C8C' })
set('IncSearch', { fg = colors.base, bg = colors.black, bold = true })
pcall(set, 'CurSearch', { fg = colors.base, bg = colors.black, bold = true })
set('Substitute', { fg = colors.base, bg = '#595959', bold = true })
set('MatchParen', { fg = colors.black, bg = '#B6B6B6', bold = true })
pcall(set, 'HlSearchNear', { fg = colors.base, bg = '#7A7A7A' })
pcall(set, 'HlSearchLens', { fg = colors.base, bg = '#A6A6A6' })
pcall(set, 'HlSearchLensNear', { fg = colors.base, bg = '#8C8C8C' })

-- Diagnostics
set('DiagnosticError', { fg = colors.red, bg = colors.panel })
set('DiagnosticWarn', { fg = colors.yellow, bg = colors.panel })
set('DiagnosticInfo', { fg = colors.cyan, bg = colors.panel })
set('DiagnosticHint', { fg = colors.green, bg = colors.panel })
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
set('@constant.builtin', { fg = colors.red, bold = true })
set('@string', { link = 'String' })
set('@character', { link = 'Character' })
set('@number', { link = 'Number' })
set('@boolean', { link = 'Boolean' })
set('@float', { link = 'Float' })
set('@function', { link = 'Function' })
set('@function.builtin', { fg = colors.cyan, bold = true })
set('@method', { link = 'Function' })
set('@keyword', { link = 'Keyword' })
set('@keyword.function', { link = 'Keyword' })
set('@keyword.operator', { link = 'Operator' })
set('@type', { link = 'Type' })
set('@type.builtin', { fg = colors.cyan, bold = true })
set('@variable', { fg = colors.fg })
set('@variable.builtin', { fg = colors.red, bold = true, italic = true })
set('@variable.parameter', { fg = colors.yellow, italic = true })
set('@variable.member', { fg = colors.fg })
set('@property', { fg = colors.fg })
set('@parameter', { fg = colors.yellow, italic = true })
set('@tag', { fg = colors.magenta })
set('@tag.attribute', { fg = colors.yellow })
set('@tag.delimiter', { fg = colors.fg })
set('@constructor', { fg = colors.magenta })
set('@namespace', { fg = colors.cyan })
set('@module', { fg = colors.cyan })
set('@operator', { link = 'Operator' })
set('@punctuation', { fg = colors.fg })
set('@punctuation.bracket', { fg = colors.fg })
set('@punctuation.delimiter', { fg = colors.fg })
set('@punctuation.special', { fg = colors.cyan })
set('@text.uri', { fg = colors.green, underline = true })
set('@text.todo', { fg = colors.base, bg = colors.yellow, bold = true })

-- Telescope
set('TelescopeBorder', { fg = colors.border })
set('TelescopePromptBorder', { fg = colors.border })
set('TelescopeResultsBorder', { fg = colors.border })
set('TelescopePreviewBorder', { fg = colors.border })
set('TelescopeSelection', { fg = colors.fg, bg = colors.selection_bg, bold = true })
set('TelescopeMatching', { fg = colors.blue, bold = true })

-- nvim-tree
set('NvimTreeNormal', { fg = colors.fg, bg = colors.panel })
set('NvimTreeFolderName', { fg = colors.cyan })
set('NvimTreeFolderIcon', { fg = colors.blue })
set('NvimTreeEmptyFolderName', { fg = colors.cyan })
set('NvimTreeOpenedFolderName', { fg = colors.cyan, bold = true })
set('NvimTreeRootFolder', { fg = colors.magenta, bold = true })
set('NvimTreeGitDirty', { fg = colors.yellow })
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
local function enforce_panel()
	set('Normal', { fg = colors.fg, bg = colors.panel })
	set('NormalNC', { fg = colors.fg, bg = colors.panel })
	set('NormalFloat', { fg = colors.fg, bg = colors.panel })
	set('StatusLine', { fg = colors.fg, bg = colors.panel })
	set('TabLine', { fg = colors.bright_black, bg = colors.panel })
	pcall(set, 'AlphaNormal', { fg = colors.fg, bg = colors.panel })
end

vim.api.nvim_create_autocmd({ 'UIEnter', 'VimEnter', 'ColorScheme' }, {
	callback = function()
		vim.schedule(enforce_panel)
	end,
})
vim.api.nvim_create_autocmd('User', {
	pattern = 'AlphaReady',
	callback = function()
		vim.schedule(enforce_panel)
	end,
})

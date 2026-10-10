-- Mecha Shell — Light Colorscheme
-- Warm off-white base, dark text, deep green accents, burnt orange literals

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.background = "light"
vim.g.colors_name = "mecha-light"

local c = {
  bg        = "#f0ece4",
  bg_alt    = "#e8e2d8",
  bg_panel  = "#d4cfc6",
  fg        = "#1a1a24",
  fg_sec    = "#484C51",
  fg_dim    = "#8b95a5",
  accent    = "#0d8a2e",
  orange    = "#c45a10",
  red       = "#a02020",
  sage      = "#6b8f72",
  none      = "NONE",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

-- ── Editor ──
hi("Normal",        { fg = c.fg, bg = c.bg })
hi("NormalFloat",   { fg = c.fg, bg = c.bg_alt })
hi("FloatBorder",   { fg = c.fg_dim, bg = c.bg_alt })
hi("FloatTitle",    { fg = c.accent, bg = c.bg_alt, bold = true })
hi("CursorLine",    { bg = c.bg_alt })
hi("CursorLineNr",  { fg = c.accent, bold = true })
hi("LineNr",        { fg = c.fg_dim })
hi("SignColumn",    { bg = c.bg })
hi("ColorColumn",   { bg = c.bg_alt })
hi("Visual",        { bg = "#c8e8c8" })
hi("VisualNOS",     { bg = "#c8e8c8" })
hi("Search",        { fg = c.bg, bg = c.orange })
hi("IncSearch",     { fg = c.bg, bg = c.accent })
hi("CurSearch",     { fg = c.bg, bg = c.accent, bold = true })
hi("Substitute",    { fg = c.bg, bg = c.orange })
hi("MatchParen",    { fg = c.accent, bold = true, underline = true })
hi("Pmenu",         { fg = c.fg, bg = c.bg_alt })
hi("PmenuSel",      { fg = c.bg, bg = c.accent })
hi("PmenuSbar",     { bg = c.bg_panel })
hi("PmenuThumb",    { bg = c.fg_dim })
hi("WinSeparator",  { fg = c.fg_dim })
hi("VertSplit",     { fg = c.fg_dim })
hi("StatusLine",    { fg = c.fg, bg = c.bg_alt })
hi("StatusLineNC",  { fg = c.fg_dim, bg = c.bg_alt })
hi("TabLine",       { fg = c.fg_dim, bg = c.bg_alt })
hi("TabLineFill",   { bg = c.bg })
hi("TabLineSel",    { fg = c.bg, bg = c.accent })
hi("Title",         { fg = c.accent, bold = true })
hi("NonText",       { fg = c.bg_panel })
hi("SpecialKey",    { fg = c.bg_panel })
hi("Whitespace",    { fg = c.bg_panel })
hi("EndOfBuffer",   { fg = c.bg })
hi("Folded",        { fg = c.fg_dim, bg = c.bg_alt })
hi("FoldColumn",    { fg = c.fg_dim, bg = c.bg })
hi("DiffAdd",       { fg = c.accent, bg = "#dff0df" })
hi("DiffChange",    { fg = c.orange, bg = "#f0e8df" })
hi("DiffDelete",    { fg = c.red, bg = "#f0dfdf" })
hi("DiffText",      { fg = c.orange, bg = "#e8dfcf", bold = true })
hi("SpellBad",      { undercurl = true, sp = c.red })
hi("SpellCap",      { undercurl = true, sp = c.orange })
hi("Directory",     { fg = c.accent })
hi("Question",      { fg = c.accent })
hi("MoreMsg",       { fg = c.accent })
hi("ModeMsg",       { fg = c.fg_sec })
hi("ErrorMsg",      { fg = c.red, bold = true })
hi("WarningMsg",    { fg = c.orange })
hi("Cursor",        { fg = c.bg, bg = c.accent })

-- ── Syntax ──
hi("Comment",       { fg = c.fg_dim, italic = true })
hi("Constant",      { fg = c.accent })
hi("String",        { fg = c.orange })
hi("Character",     { fg = c.orange })
hi("Number",        { fg = c.orange })
hi("Boolean",       { fg = c.orange, bold = true })
hi("Float",         { fg = c.orange })
hi("Identifier",    { fg = c.fg })
hi("Function",      { fg = c.accent })
hi("Statement",     { fg = c.accent, bold = true })
hi("Conditional",   { fg = c.accent, bold = true })
hi("Repeat",        { fg = c.accent, bold = true })
hi("Label",         { fg = c.accent })
hi("Operator",      { fg = c.fg_sec })
hi("Keyword",       { fg = c.accent, bold = true })
hi("Exception",     { fg = c.red, bold = true })
hi("PreProc",       { fg = c.fg_sec })
hi("Include",       { fg = c.fg_sec })
hi("Type",          { fg = c.fg_sec })
hi("StorageClass",  { fg = c.accent })
hi("Structure",     { fg = c.fg_sec })
hi("Special",       { fg = c.orange })
hi("Tag",           { fg = c.accent })
hi("Delimiter",     { fg = c.fg_dim })
hi("Todo",          { fg = c.bg, bg = c.orange, bold = true })
hi("Error",         { fg = c.red })

-- ── Treesitter ──
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.orange, italic = true })
hi("@variable.parameter",    { fg = c.fg, italic = true })
hi("@variable.member",       { fg = c.sage })
hi("@constant",              { fg = c.accent })
hi("@constant.builtin",      { fg = c.orange, bold = true })
hi("@module",                { fg = c.fg_sec })
hi("@string",                { fg = c.orange })
hi("@string.documentation",  { fg = c.fg_dim, italic = true })
hi("@string.escape",         { fg = c.orange, bold = true })
hi("@character",             { fg = c.orange })
hi("@number",                { fg = c.orange })
hi("@number.float",          { fg = c.orange })
hi("@boolean",               { fg = c.orange, bold = true })
hi("@function",              { fg = c.accent })
hi("@function.builtin",      { fg = c.accent, italic = true })
hi("@function.call",         { fg = c.accent })
hi("@function.method",       { fg = c.accent })
hi("@function.method.call",  { fg = c.accent })
hi("@constructor",           { fg = c.fg_sec })
hi("@operator",              { fg = c.fg_sec })
hi("@keyword",               { fg = c.accent, bold = true })
hi("@keyword.function",      { fg = c.accent, bold = true })
hi("@keyword.operator",      { fg = c.fg_sec })
hi("@keyword.import",        { fg = c.fg_sec })
hi("@keyword.type",          { fg = c.fg_sec })
hi("@keyword.repeat",        { fg = c.accent, bold = true })
hi("@keyword.return",        { fg = c.accent, bold = true })
hi("@keyword.exception",     { fg = c.red, bold = true })
hi("@keyword.conditional",   { fg = c.accent, bold = true })
hi("@keyword.conditional.ternary", { fg = c.fg_sec })
hi("@type",                  { fg = c.fg_sec })
hi("@type.builtin",          { fg = c.fg_sec, italic = true })
hi("@attribute",             { fg = c.fg_sec })
hi("@property",              { fg = c.sage })
hi("@comment",               { fg = c.fg_dim, italic = true })
hi("@comment.todo",          { fg = c.bg, bg = c.orange, bold = true })
hi("@comment.note",          { fg = c.bg, bg = c.accent, bold = true })
hi("@comment.error",         { fg = c.red, bold = true })
hi("@comment.warning",       { fg = c.orange, bold = true })
hi("@punctuation.bracket",   { fg = c.fg_dim })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@punctuation.special",   { fg = c.orange })
hi("@markup.heading",        { fg = c.accent, bold = true })
hi("@markup.raw",            { fg = c.orange })
hi("@markup.link",           { fg = c.accent, underline = true })
hi("@markup.list",           { fg = c.accent })
hi("@tag",                   { fg = c.accent })
hi("@tag.attribute",         { fg = c.sage })
hi("@tag.delimiter",         { fg = c.fg_dim })

-- ── LSP Semantic Tokens ──
hi("@lsp.type.class",        { fg = c.fg_sec })
hi("@lsp.type.function",     { fg = c.accent })
hi("@lsp.type.method",       { fg = c.accent })
hi("@lsp.type.parameter",    { fg = c.fg, italic = true })
hi("@lsp.type.property",     { fg = c.sage })
hi("@lsp.type.variable",     { fg = c.fg })
hi("@lsp.type.namespace",    { fg = c.fg_sec })
hi("@lsp.type.type",         { fg = c.fg_sec })
hi("@lsp.type.interface",    { fg = c.fg_sec, italic = true })
hi("@lsp.type.enum",         { fg = c.fg_sec })
hi("@lsp.type.enumMember",   { fg = c.accent })

-- ── Diagnostics ──
hi("DiagnosticError",         { fg = c.red })
hi("DiagnosticWarn",          { fg = c.orange })
hi("DiagnosticInfo",          { fg = c.accent })
hi("DiagnosticHint",          { fg = c.sage })
hi("DiagnosticUnderlineError",{ undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.accent })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.sage })
hi("DiagnosticVirtualTextError", { fg = c.red, bg = "#f0dfdf" })
hi("DiagnosticVirtualTextWarn",  { fg = c.orange, bg = "#f0e8df" })
hi("DiagnosticVirtualTextInfo",  { fg = c.accent, bg = "#dff0df" })
hi("DiagnosticVirtualTextHint",  { fg = c.sage, bg = "#e0f0e0" })
hi("DiagnosticSignError",    { fg = c.red })
hi("DiagnosticSignWarn",     { fg = c.orange })
hi("DiagnosticSignInfo",     { fg = c.accent })
hi("DiagnosticSignHint",     { fg = c.sage })

-- ── GitSigns ──
hi("GitSignsAdd",    { fg = c.accent })
hi("GitSignsChange", { fg = c.orange })
hi("GitSignsDelete", { fg = c.red })

-- ── Telescope ──
hi("TelescopeNormal",        { fg = c.fg, bg = c.bg })
hi("TelescopeBorder",        { fg = c.fg_dim, bg = c.bg })
hi("TelescopeTitle",         { fg = c.accent, bold = true })
hi("TelescopePromptNormal",  { fg = c.fg, bg = c.bg_alt })
hi("TelescopePromptBorder",  { fg = c.accent, bg = c.bg_alt })
hi("TelescopePromptTitle",   { fg = c.bg, bg = c.accent, bold = true })
hi("TelescopePromptPrefix",  { fg = c.accent })
hi("TelescopeSelection",     { fg = c.fg, bg = c.bg_alt })
hi("TelescopeSelectionCaret",{ fg = c.accent })
hi("TelescopeMatching",      { fg = c.accent, bold = true })

-- ── NvimTree ──
hi("NvimTreeNormal",          { fg = c.fg, bg = c.bg })
hi("NvimTreeWinSeparator",    { fg = c.fg_dim, bg = c.bg })
hi("NvimTreeFolderName",      { fg = c.accent })
hi("NvimTreeOpenedFolderName", { fg = c.accent, bold = true })
hi("NvimTreeRootFolder",      { fg = c.accent, bold = true })
hi("NvimTreeFolderIcon",      { fg = c.accent })
hi("NvimTreeGitDirty",        { fg = c.orange })
hi("NvimTreeGitNew",          { fg = c.accent })
hi("NvimTreeGitDeleted",      { fg = c.red })
hi("NvimTreeIndentMarker",    { fg = c.bg_panel })

-- ── IndentBlankline ──
hi("IblIndent",  { fg = "#e0dcd4" })
hi("IblScope",   { fg = c.fg_dim })

-- ── WhichKey / Noice / Notify / Trouble / Aerial ──
hi("WhichKey",          { fg = c.accent })
hi("WhichKeyGroup",     { fg = c.fg_sec })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeyFloat",     { bg = c.bg_alt })
hi("NoiceCmdline",      { fg = c.fg, bg = c.bg_alt })
hi("NoiceCmdlineIcon",  { fg = c.accent })
hi("NotifyERRORBorder", { fg = c.red })
hi("NotifyWARNBorder",  { fg = c.orange })
hi("NotifyINFOBorder",  { fg = c.accent })
hi("TroubleNormal",    { fg = c.fg, bg = c.bg })
hi("TroubleCount",     { fg = c.bg, bg = c.accent })
hi("AerialLine",       { bg = c.bg_alt })

-- ── Terminal colors ──
vim.g.terminal_color_0  = c.fg
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.accent
vim.g.terminal_color_3  = c.orange
vim.g.terminal_color_4  = c.fg_dim
vim.g.terminal_color_5  = c.red
vim.g.terminal_color_6  = c.accent
vim.g.terminal_color_7  = c.bg
vim.g.terminal_color_8  = c.fg_dim
vim.g.terminal_color_9  = c.orange
vim.g.terminal_color_10 = c.sage
vim.g.terminal_color_11 = c.fg_sec
vim.g.terminal_color_12 = c.fg
vim.g.terminal_color_13 = c.orange
vim.g.terminal_color_14 = c.sage
vim.g.terminal_color_15 = c.bg_panel

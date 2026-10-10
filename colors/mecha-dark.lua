-- Mecha Shell — Dark Colorscheme
-- Near-black base, warm cream text, neon green accents, orange literals

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then vim.cmd("syntax reset") end
vim.o.background = "dark"
vim.g.colors_name = "mecha-dark"

local c = {
  bg        = "#0a0a0f",
  bg_alt    = "#1a1a24",
  bg_panel  = "#484C51",
  fg        = "#e8d8c9",
  fg_sec    = "#C2C4C8",
  fg_dim    = "#4b607f",
  accent    = "#00FF43",
  orange    = "#f3701e",
  red       = "#B83A2D",
  sage      = "#4E6851",
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
hi("Visual",        { bg = "#1e3a1e" })
hi("VisualNOS",     { bg = "#1e3a1e" })
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
hi("WinBar",        { fg = c.fg_sec, bg = c.bg })
hi("WinBarNC",      { fg = c.fg_dim, bg = c.bg })
hi("Title",         { fg = c.accent, bold = true })
hi("NonText",       { fg = c.bg_panel })
hi("SpecialKey",    { fg = c.bg_panel })
hi("Whitespace",    { fg = c.bg_panel })
hi("EndOfBuffer",   { fg = c.bg })
hi("Folded",        { fg = c.fg_dim, bg = c.bg_alt })
hi("FoldColumn",    { fg = c.fg_dim, bg = c.bg })
hi("DiffAdd",       { fg = c.accent, bg = "#0a1f0a" })
hi("DiffChange",    { fg = c.orange, bg = "#1f1a0a" })
hi("DiffDelete",    { fg = c.red, bg = "#1f0a0a" })
hi("DiffText",      { fg = c.orange, bg = "#2a1f0a", bold = true })
hi("SpellBad",      { undercurl = true, sp = c.red })
hi("SpellCap",      { undercurl = true, sp = c.orange })
hi("SpellLocal",    { undercurl = true, sp = c.accent })
hi("SpellRare",     { undercurl = true, sp = c.sage })
hi("Directory",     { fg = c.accent })
hi("Question",      { fg = c.accent })
hi("MoreMsg",       { fg = c.accent })
hi("ModeMsg",       { fg = c.fg_sec })
hi("ErrorMsg",      { fg = c.red, bold = true })
hi("WarningMsg",    { fg = c.orange })
hi("WildMenu",      { fg = c.bg, bg = c.accent })
hi("Conceal",       { fg = c.fg_dim })
hi("Cursor",        { fg = c.bg, bg = c.accent })
hi("lCursor",       { fg = c.bg, bg = c.accent })
hi("CursorIM",      { fg = c.bg, bg = c.accent })

-- ── Syntax (traditional vim groups) ──
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
hi("Define",        { fg = c.fg_sec })
hi("Macro",         { fg = c.fg_sec })
hi("PreCondit",     { fg = c.fg_sec })
hi("Type",          { fg = c.fg_sec })
hi("StorageClass",  { fg = c.accent })
hi("Structure",     { fg = c.fg_sec })
hi("Typedef",       { fg = c.fg_sec })
hi("Special",       { fg = c.orange })
hi("SpecialChar",   { fg = c.orange })
hi("Tag",           { fg = c.accent })
hi("Delimiter",     { fg = c.fg_dim })
hi("SpecialComment",{ fg = c.fg_dim, bold = true })
hi("Debug",         { fg = c.orange })
hi("Underlined",    { underline = true })
hi("Error",         { fg = c.red })
hi("Todo",          { fg = c.bg, bg = c.orange, bold = true })

-- ── Treesitter ──
hi("@variable",              { fg = c.fg })
hi("@variable.builtin",      { fg = c.orange, italic = true })
hi("@variable.parameter",    { fg = c.fg, italic = true })
hi("@variable.member",       { fg = c.sage })
hi("@constant",              { fg = c.accent })
hi("@constant.builtin",      { fg = c.orange, bold = true })
hi("@constant.macro",        { fg = c.fg_sec })
hi("@module",                { fg = c.fg_sec })
hi("@label",                 { fg = c.accent })
hi("@string",                { fg = c.orange })
hi("@string.documentation",  { fg = c.fg_dim, italic = true })
hi("@string.regex",          { fg = c.orange })
hi("@string.escape",         { fg = c.orange, bold = true })
hi("@string.special",        { fg = c.orange })
hi("@character",             { fg = c.orange })
hi("@character.special",     { fg = c.orange, bold = true })
hi("@number",                { fg = c.orange })
hi("@number.float",          { fg = c.orange })
hi("@boolean",               { fg = c.orange, bold = true })
hi("@function",              { fg = c.accent })
hi("@function.builtin",      { fg = c.accent, italic = true })
hi("@function.call",         { fg = c.accent })
hi("@function.macro",        { fg = c.fg_sec })
hi("@function.method",       { fg = c.accent })
hi("@function.method.call",  { fg = c.accent })
hi("@constructor",           { fg = c.fg_sec })
hi("@operator",              { fg = c.fg_sec })
hi("@keyword",               { fg = c.accent, bold = true })
hi("@keyword.coroutine",     { fg = c.accent, bold = true })
hi("@keyword.function",      { fg = c.accent, bold = true })
hi("@keyword.operator",      { fg = c.fg_sec })
hi("@keyword.import",        { fg = c.fg_sec })
hi("@keyword.type",          { fg = c.fg_sec })
hi("@keyword.modifier",      { fg = c.fg_sec })
hi("@keyword.repeat",        { fg = c.accent, bold = true })
hi("@keyword.return",        { fg = c.accent, bold = true })
hi("@keyword.debug",         { fg = c.orange })
hi("@keyword.exception",     { fg = c.red, bold = true })
hi("@keyword.conditional",   { fg = c.accent, bold = true })
hi("@keyword.conditional.ternary", { fg = c.fg_sec })
hi("@keyword.directive",     { fg = c.fg_sec })
hi("@keyword.directive.define", { fg = c.fg_sec })
hi("@type",                  { fg = c.fg_sec })
hi("@type.builtin",          { fg = c.fg_sec, italic = true })
hi("@type.definition",       { fg = c.fg_sec })
hi("@type.qualifier",        { fg = c.fg_sec })
hi("@attribute",             { fg = c.fg_sec })
hi("@attribute.builtin",     { fg = c.fg_sec, italic = true })
hi("@property",              { fg = c.sage })
hi("@comment",               { fg = c.fg_dim, italic = true })
hi("@comment.documentation", { fg = c.fg_dim, italic = true })
hi("@comment.error",         { fg = c.red, bold = true })
hi("@comment.warning",       { fg = c.orange, bold = true })
hi("@comment.todo",          { fg = c.bg, bg = c.orange, bold = true })
hi("@comment.note",          { fg = c.bg, bg = c.accent, bold = true })
hi("@punctuation.bracket",   { fg = c.fg_dim })
hi("@punctuation.delimiter", { fg = c.fg_dim })
hi("@punctuation.special",   { fg = c.orange })
hi("@markup.strong",         { bold = true })
hi("@markup.italic",         { italic = true })
hi("@markup.strikethrough",  { strikethrough = true })
hi("@markup.underline",      { underline = true })
hi("@markup.heading",        { fg = c.accent, bold = true })
hi("@markup.raw",            { fg = c.orange })
hi("@markup.link",           { fg = c.accent, underline = true })
hi("@markup.link.url",       { fg = c.fg_dim, underline = true })
hi("@markup.list",           { fg = c.accent })
hi("@tag",                   { fg = c.accent })
hi("@tag.attribute",         { fg = c.sage })
hi("@tag.delimiter",         { fg = c.fg_dim })

-- ── LSP Semantic Tokens ──
hi("@lsp.type.class",        { fg = c.fg_sec })
hi("@lsp.type.decorator",    { fg = c.fg_sec })
hi("@lsp.type.enum",         { fg = c.fg_sec })
hi("@lsp.type.enumMember",   { fg = c.accent })
hi("@lsp.type.function",     { fg = c.accent })
hi("@lsp.type.interface",    { fg = c.fg_sec, italic = true })
hi("@lsp.type.macro",        { fg = c.fg_sec })
hi("@lsp.type.method",       { fg = c.accent })
hi("@lsp.type.namespace",    { fg = c.fg_sec })
hi("@lsp.type.parameter",    { fg = c.fg, italic = true })
hi("@lsp.type.property",     { fg = c.sage })
hi("@lsp.type.struct",       { fg = c.fg_sec })
hi("@lsp.type.type",         { fg = c.fg_sec })
hi("@lsp.type.typeParameter",{ fg = c.fg_sec, italic = true })
hi("@lsp.type.variable",     { fg = c.fg })

-- ── Diagnostics ──
hi("DiagnosticError",         { fg = c.red })
hi("DiagnosticWarn",          { fg = c.orange })
hi("DiagnosticInfo",          { fg = c.accent })
hi("DiagnosticHint",          { fg = c.sage })
hi("DiagnosticUnderlineError",{ undercurl = true, sp = c.red })
hi("DiagnosticUnderlineWarn", { undercurl = true, sp = c.orange })
hi("DiagnosticUnderlineInfo", { undercurl = true, sp = c.accent })
hi("DiagnosticUnderlineHint", { undercurl = true, sp = c.sage })
hi("DiagnosticVirtualTextError", { fg = c.red, bg = "#1a0a0a" })
hi("DiagnosticVirtualTextWarn",  { fg = c.orange, bg = "#1a150a" })
hi("DiagnosticVirtualTextInfo",  { fg = c.accent, bg = "#0a1a0f" })
hi("DiagnosticVirtualTextHint",  { fg = c.sage, bg = "#0a1a10" })
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
hi("TelescopeResultsNormal", { fg = c.fg, bg = c.bg })
hi("TelescopeResultsBorder", { fg = c.fg_dim, bg = c.bg })
hi("TelescopePreviewNormal", { fg = c.fg, bg = c.bg })
hi("TelescopePreviewBorder", { fg = c.fg_dim, bg = c.bg })
hi("TelescopeSelection",     { fg = c.fg, bg = c.bg_alt })
hi("TelescopeSelectionCaret",{ fg = c.accent })
hi("TelescopeMatching",      { fg = c.accent, bold = true })

-- ── NvimTree ──
hi("NvimTreeNormal",          { fg = c.fg, bg = c.bg })
hi("NvimTreeWinSeparator",    { fg = c.fg_dim, bg = c.bg })
hi("NvimTreeFolderName",      { fg = c.accent })
hi("NvimTreeOpenedFolderName", { fg = c.accent, bold = true })
hi("NvimTreeRootFolder",      { fg = c.accent, bold = true })
hi("NvimTreeEmptyFolderName", { fg = c.fg_dim })
hi("NvimTreeFolderIcon",      { fg = c.accent })
hi("NvimTreeFolderArrowOpen", { fg = c.accent })
hi("NvimTreeFolderArrowClosed", { fg = c.fg_dim })
hi("NvimTreeGitDirty",        { fg = c.orange })
hi("NvimTreeGitNew",          { fg = c.accent })
hi("NvimTreeGitDeleted",      { fg = c.red })
hi("NvimTreeIndentMarker",    { fg = c.bg_panel })
hi("NvimTreeSpecialFile",     { fg = c.orange })

-- ── IndentBlankline ──
hi("IblIndent",  { fg = "#1a1a24" })
hi("IblScope",   { fg = c.fg_dim })

-- ── WhichKey ──
hi("WhichKey",          { fg = c.accent })
hi("WhichKeyGroup",     { fg = c.fg_sec })
hi("WhichKeyDesc",      { fg = c.fg })
hi("WhichKeySeparator", { fg = c.fg_dim })
hi("WhichKeyFloat",     { bg = c.bg_alt })

-- ── Noice / Notify ──
hi("NoiceCmdline",      { fg = c.fg, bg = c.bg_alt })
hi("NoiceCmdlinePopup", { fg = c.fg, bg = c.bg_alt })
hi("NoiceCmdlineIcon",  { fg = c.accent })
hi("NotifyERRORBorder", { fg = c.red })
hi("NotifyWARNBorder",  { fg = c.orange })
hi("NotifyINFOBorder",  { fg = c.accent })
hi("NotifyDEBUGBorder", { fg = c.fg_dim })
hi("NotifyTRACEBorder", { fg = c.sage })
hi("NotifyERRORTitle",  { fg = c.red })
hi("NotifyWARNTitle",   { fg = c.orange })
hi("NotifyINFOTitle",   { fg = c.accent })

-- ── Trouble ──
hi("TroubleNormal",    { fg = c.fg, bg = c.bg })
hi("TroubleCount",     { fg = c.bg, bg = c.accent })
hi("TroubleText",      { fg = c.fg })

-- ── Aerial ──
hi("AerialLine",       { bg = c.bg_alt })
hi("AerialGuide",      { fg = c.bg_panel })

-- ── Terminal colors ──
vim.g.terminal_color_0  = c.bg
vim.g.terminal_color_1  = c.red
vim.g.terminal_color_2  = c.accent
vim.g.terminal_color_3  = c.orange
vim.g.terminal_color_4  = c.fg_dim
vim.g.terminal_color_5  = c.red
vim.g.terminal_color_6  = c.accent
vim.g.terminal_color_7  = c.fg
vim.g.terminal_color_8  = c.bg_panel
vim.g.terminal_color_9  = c.orange
vim.g.terminal_color_10 = c.sage
vim.g.terminal_color_11 = c.fg_sec
vim.g.terminal_color_12 = c.fg
vim.g.terminal_color_13 = c.orange
vim.g.terminal_color_14 = c.sage
vim.g.terminal_color_15 = c.fg_sec

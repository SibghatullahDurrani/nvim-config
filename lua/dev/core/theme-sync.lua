-- Theme sync configuration for omarchy integration
-- Maps omarchy themes to nvim colorschemes

local M = {}

-- Track the last applied theme to avoid unnecessary reloads
M.current_theme = nil

-- Theme mapping: omarchy theme name -> nvim colorscheme
-- Currently installed: gruvbox, catppuccin
-- To use other themes, install the corresponding nvim plugin via lazy.nvim
M.theme_map = {
	-- Installed themes
	["gruvbox"] = "gruvbox",
	["catppuccin"] = "catppuccin-mocha",
	["catppuccin-latte"] = "catppuccin-latte",
	["aetheria"] = "aetheria",
	["bliss"] = "bliss",
	["hackerman"] = "hackerman",
	["osaka-jade"] = "osaka-jade",

	-- Additional themes (install plugins if needed):
	["nord"] = "nord", -- requires "shaunsingh/nord.nvim"
	["tokyo-night"] = "tokyonight", -- requires "folke/tokyonight.nvim"
	["rose-pine"] = "rose-pine", -- requires "rose-pine/neovim"
	["kanagawa"] = "kanagawa", -- requires "rebelot/kanagawa.nvim"
	["everforest"] = "everforest", -- requires "sainnhe/everforest"

	-- Default fallback for unmapped/missing themes
	["default"] = "gruvbox",
}

-- Function to set colorscheme based on omarchy theme
function M.set_theme(omarchy_theme)
	-- Skip if theme hasn't changed
	if M.current_theme == omarchy_theme then
		return
	end

	local nvim_theme = M.theme_map[omarchy_theme] or M.theme_map["default"]

	-- Set background based on theme
	if omarchy_theme == "gruvbox" then
		vim.o.background = "dark"
	elseif omarchy_theme == "catppuccin-latte" or omarchy_theme == "bliss" then
		vim.o.background = "light"
	else
		vim.o.background = "dark" -- Default to dark for most themes
	end

	-- Check if the colorscheme is available
	local ok = pcall(vim.cmd.colorscheme, nvim_theme)
	if ok then
		M.current_theme = omarchy_theme
		-- Refresh lualine to match new colorscheme
		local lualine_theme = "auto"
		if omarchy_theme == "aetheria" then
			lualine_theme = "aetheria"
		elseif omarchy_theme == "bliss" then
			lualine_theme = "bliss"
		elseif omarchy_theme == "hackerman" then
			lualine_theme = "hackerman"
		elseif omarchy_theme == "osaka-jade" then
			lualine_theme = "osaka-jade"
		end
		pcall(function()
			require("lualine").setup({ options = { theme = lualine_theme } })
		end)
	else
		vim.notify("Colorscheme '" .. nvim_theme .. "' not found, using default", vim.log.levels.WARN)
		vim.o.background = "dark"
		vim.cmd.colorscheme(M.theme_map["default"])
		M.current_theme = "default"
		-- Refresh lualine for default theme too
		pcall(function()
			require("lualine").setup({ options = { theme = "auto" } })
		end)
	end
end

-- Function to load theme from omarchy current theme
function M.sync_with_omarchy()
	local omarchy_theme_path = vim.fn.expand("~/.config/omarchy/current/theme")
	local theme_link = vim.fn.resolve(omarchy_theme_path)

	if theme_link ~= "" then
		-- Extract theme name from path (e.g., /path/to/themes/gruvbox -> gruvbox)
		local theme_name = vim.fn.fnamemodify(theme_link, ":t")
		M.set_theme(theme_name)
	end
end

-- Auto-sync with omarchy on startup (after plugins are loaded)
vim.api.nvim_create_autocmd("VimEnter", {
	callback = function()
		M.sync_with_omarchy()
	end,
})

-- Watch for theme changes from omarchy
-- This watches the symlink for changes and auto-updates the theme
local theme_link = vim.fn.expand("~/.config/omarchy/current/theme")
vim.api.nvim_create_autocmd({ "FileChangedShellPost", "FocusGained" }, {
	callback = function()
		-- Check if the omarchy theme has changed
		local current_link = vim.fn.resolve(theme_link)
		if current_link ~= "" then
			local theme_name = vim.fn.fnamemodify(current_link, ":t")
			M.set_theme(theme_name)
		end
	end,
})

-- Also set up a timer to periodically check for theme changes
-- This ensures we catch changes even if the above autocmds don't fire
local timer = vim.loop.new_timer()
if timer then
	timer:start(
		1000, -- Wait 1 second before first check
		2000, -- Check every 2 seconds
		vim.schedule_wrap(function()
			M.sync_with_omarchy()
		end)
	)
end

return M

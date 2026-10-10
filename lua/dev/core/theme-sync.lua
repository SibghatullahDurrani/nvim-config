-- Mecha Shell — Theme sync
-- Reads from ~/.config/mecha-shell/config/active-mode and applies matching colorscheme.
-- Polls every 2 seconds to detect changes from mecha-theme toggle.

local M = {}

local mode_file = vim.fn.expand("~/.config/mecha-shell/config/active-mode")
M.current_mode = nil

local theme_map = {
  dark = "mecha-dark",
  light = "mecha-light",
}

local lualine_map = {
  dark = "mecha-dark",
  light = "mecha-light",
}

local function read_mode()
  local f = io.open(mode_file, "r")
  if not f then return "dark" end
  local mode = f:read("*l")
  f:close()
  return (mode and mode:match("^%s*(.-)%s*$")) or "dark"
end

function M.set_theme(mode)
  if M.current_mode == mode then return end

  local scheme = theme_map[mode] or "mecha-dark"
  local ok = pcall(vim.cmd.colorscheme, scheme)
  if not ok then
    vim.notify("mecha-theme: failed to load " .. scheme, vim.log.levels.WARN)
    return
  end

  M.current_mode = mode

  -- Refresh lualine
  pcall(function()
    local lualine_theme = lualine_map[mode] or "mecha-dark"
    require("lualine").setup({ options = { theme = lualine_theme } })
    require("lualine").refresh()
  end)
end

function M.sync()
  local mode = read_mode()
  M.set_theme(mode)
end

-- Apply on VimEnter (after plugins load)
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    M.sync()
  end,
})

-- Sync on focus gained (switching back to nvim after mecha-theme toggle)
vim.api.nvim_create_autocmd("FocusGained", {
  callback = function()
    M.sync()
  end,
})

-- Poll every 2 seconds for theme changes
local timer = vim.uv.new_timer()
if timer then
  timer:start(1000, 2000, vim.schedule_wrap(function()
    M.sync()
  end))
end

return M

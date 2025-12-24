local M = {}

-- Track per-directory Claude instances
local instances = {}

-- Utility: get system-wide directories using fd
local function get_all_directories()
	local handle = io.popen("fd -t d . /  2>/dev/null")
	if not handle then
		return {}
	end

	local result = {}
	for line in handle:lines() do
		table.insert(result, line)
	end
	handle:close()

	return result
end

-- Open Claude in vertical split to the right
local function open_claude_pane(dir_key, dir)
	local buf, win

	-- Reuse buffer if exists
	if instances[dir_key] and instances[dir_key].buf and vim.api.nvim_buf_is_valid(instances[dir_key].buf) then
		buf = instances[dir_key].buf
	else
		-- Open vertical split first
		vim.cmd("vsplit")
		win = vim.api.nvim_get_current_win()

		-- Start terminal with Claude CLI directly
		local term_cmd = "cd " .. vim.fn.shellescape(dir) .. " && claude"
		vim.cmd("terminal " .. term_cmd)

		buf = vim.api.nvim_get_current_buf()

		vim.api.nvim_win_set_width(win, 70)
		vim.cmd("startinsert")

		-- Save instance
		instances[dir_key] = { buf = buf, win = win, dir = dir }
		return
	end

	-- If buffer already exists, just open it in a new split
	vim.cmd("vsplit")
	win = vim.api.nvim_get_current_win()
	vim.api.nvim_win_set_buf(win, buf)
	vim.api.nvim_win_set_width(win, 70)
	instances[dir_key].win = win
end

-- Close pane but keep buffer
local function close_pane(dir_key)
	local inst = instances[dir_key]
	if inst and inst.win and vim.api.nvim_win_is_valid(inst.win) then
		vim.api.nvim_win_close(inst.win, false)
	end
	if inst then
		inst.win = nil
	end
end

-- Toggle pane
local function toggle_pane(dir_key, dir)
	local inst = instances[dir_key]
	if inst and inst.win and vim.api.nvim_win_is_valid(inst.win) then
		close_pane(dir_key)
	else
		open_claude_pane(dir_key, dir)
	end
end

-- Open Claude in current working directory
function M.open_current()
	local dir = vim.fn.getcwd()
	toggle_pane("__cwd__", dir)
end

-- Pick a system-wide directory using fd and vim.ui.select
function M.pick_directory()
	local dirs = get_all_directories()
	if #dirs == 0 then
		vim.notify("No directories found (fd required)", vim.log.levels.ERROR)
		return
	end

	vim.ui.select(dirs, {
		prompt = "Select directory for Claude:",
		format_item = function(item)
			return item
		end,
	}, function(choice)
		if choice then
			local key = choice:gsub("/", "_"):gsub("\\", "_")
			toggle_pane(key, choice)
		end
	end)
end

return M

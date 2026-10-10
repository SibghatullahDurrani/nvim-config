local M = {}

local state = { buf = nil, win = nil }

local function close()
	if state.win and vim.api.nvim_win_is_valid(state.win) then
		vim.api.nvim_win_close(state.win, true)
	end
	state.win = nil
	state.buf = nil
end

function M.open_current()
	if vim.fn.executable("glow") == 0 then
		vim.notify("glow is not installed or not in PATH", vim.log.levels.ERROR)
		return
	end

	local path = vim.fn.expand("%:p")
	if path == "" then
		vim.notify("No file to preview", vim.log.levels.WARN)
		return
	end
	if vim.fn.filereadable(path) == 0 then
		vim.notify("File is not readable on disk (save it first)", vim.log.levels.WARN)
		return
	end

	if state.win and vim.api.nvim_win_is_valid(state.win) then
		close()
		return
	end

	local width = math.floor(vim.o.columns * 0.85)
	local height = math.floor(vim.o.lines * 0.85)
	local row = math.floor((vim.o.lines - height) / 2)
	local col = math.floor((vim.o.columns - width) / 2)

	state.buf = vim.api.nvim_create_buf(false, true)
	state.win = vim.api.nvim_open_win(state.buf, true, {
		relative = "editor",
		width = width,
		height = height,
		row = row,
		col = col,
		style = "minimal",
		border = "rounded",
		title = " 󰽛  " .. vim.fn.fnamemodify(path, ":t") .. " ",
		title_pos = "center",
	})

	vim.fn.jobstart({ "glow", "-s", "dark", "-w", tostring(width - 4), path }, {
		term = true,
	})

	-- Drop into normal mode so j/k/gg/G scroll the rendered output.
	vim.cmd("stopinsert")

	local close_keys = { "q", "<Esc>" }
	for _, key in ipairs(close_keys) do
		vim.keymap.set("n", key, close, { buffer = state.buf, nowait = true, silent = true })
	end
end

return M

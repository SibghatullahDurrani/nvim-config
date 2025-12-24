local M = {}

local term_buf = nil
local term_win = nil

function M.toggle()
	-- If terminal window exists → close it
	if term_win and vim.api.nvim_win_is_valid(term_win) then
		vim.api.nvim_win_close(term_win, true)
		term_win = nil
		return
	end

	-- If buffer doesn't exist, create a terminal buffer
	if not term_buf or not vim.api.nvim_buf_is_valid(term_buf) then
		vim.cmd("botright split")
		vim.cmd("resize 15") -- bottom terminal height
		vim.cmd("terminal")
		term_win = vim.api.nvim_get_current_win()
		term_buf = vim.api.nvim_get_current_buf()
	else
		-- Reopen terminal buffer in a bottom split
		vim.cmd("botright split")
		vim.cmd("resize 15")
		vim.api.nvim_win_set_buf(0, term_buf)
		term_win = vim.api.nvim_get_current_win()
	end

	vim.cmd("startinsert")
end

return M

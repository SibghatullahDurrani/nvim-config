-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

local claude = require("dev.claude")

-- Claude in current directory
vim.keymap.set("n", "<leader>co", function()
	claude.open_current()
end, { desc = "Open Claude pane (current directory)" })

-- Claude in picked directory
vim.keymap.set("n", "<leader>cn", function()
	claude.pick_directory()
end, { desc = "Open Claude pane (choose directory)" })

-- ===============================
-- Split Navigation Keymaps (tmux-aware)
-- ===============================
-- <C-hjkl> move between nvim splits, and fall through to tmux panes
-- when there's no split left to move to (see plugins/tmux-navigator.lua
-- and the "is_vim" forwarding in ~/.config/tmux/tmux.conf).

-- Options
local opts = { noremap = true, silent = true }

-- Normal mode: navigate splits / tmux panes
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", opts)
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", opts)
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", opts)
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", opts)

-- Terminal mode: navigate splits / tmux panes without leaving insert mode
vim.keymap.set("t", "<C-h>", [[<C-\><C-n><cmd>TmuxNavigateLeft<CR>]], opts)
vim.keymap.set("t", "<C-l>", [[<C-\><C-n><cmd>TmuxNavigateRight<CR>]], opts)
vim.keymap.set("t", "<C-j>", [[<C-\><C-n><cmd>TmuxNavigateDown<CR>]], opts)
vim.keymap.set("t", "<C-k>", [[<C-\><C-n><cmd>TmuxNavigateUp<CR>]], opts)

vim.keymap.set("n", "<leader>t", function()
	require("dev.core.terminal").toggle()
end, { noremap = true, silent = true })
vim.keymap.set("t", "<C-c>", [[<C-\><C-n>]], { noremap = true, silent = true })

-- Open current file in default browser (HTML preview, mirrors <leader>mp).
vim.keymap.set("n", "<leader>hp", function()
	require("dev.core.browser").open_current()
end, { desc = "Preview current file in browser" })

-- Preview current markdown file in a floating glow popup.
vim.keymap.set("n", "<leader>mp", function()
	require("dev.core.glow").open_current()
end, { desc = "Preview markdown in glow popup" })

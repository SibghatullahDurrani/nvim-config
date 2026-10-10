return {
	"christoomey/vim-tmux-navigator",
	cmd = {
		"TmuxNavigateLeft",
		"TmuxNavigateDown",
		"TmuxNavigateUp",
		"TmuxNavigateRight",
		"TmuxNavigatePrevious",
	},
	init = function()
		-- We define our own keymaps in dev.core.keymaps instead of the
		-- plugin's default normal-mode-only mappings, so it also works
		-- from terminal mode.
		vim.g.tmux_navigator_no_mappings = 1
	end,
}

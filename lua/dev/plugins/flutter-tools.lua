return {
	"akinsho/flutter-tools.nvim",
	enabled = vim.fn.executable("flutter") == 1, -- Only enable if Flutter is installed
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim",
	},
	config = function()
		require("flutter-tools").setup({
			ui = {
				border = "rounded",
				notification_style = "nvim-notify",
			},
			decorations = {
				statusline = {
					app_version = true,
					device = true,
					project_config = true,
				},
			},
			debugger = {
				enabled = false,
				run_via_dap = false,
			},
			flutter_path = nil, -- uses the flutter from PATH
			flutter_lookup_cmd = nil,
			fvm = false, -- use FVM if enabled
			widget_guides = {
				enabled = true,
			},
			closing_tags = {
				highlight = "Comment",
				prefix = "// ",
				enabled = true,
			},
			dev_log = {
				enabled = true,
				notify_errors = false,
				open_cmd = "tabedit",
			},
			dev_tools = {
				autostart = false,
				auto_open_browser = false,
			},
			outline = {
				open_cmd = "30vnew",
				auto_open = false,
			},
			lsp = {
				color = {
					enabled = true,
					background = false,
					background_color = nil,
					foreground = false,
					virtual_text = true,
					virtual_text_str = "■",
				},
				on_attach = function(_, bufnr)
					-- Add Flutter-specific keymaps (using capital F to avoid conflicts with Telescope)
					local opts = { buffer = bufnr, noremap = true, silent = true }
					vim.keymap.set("n", "<leader>Fr", "<cmd>FlutterRun<cr>", vim.tbl_extend("force", opts, { desc = "Flutter run" }))
					vim.keymap.set("n", "<leader>Fq", "<cmd>FlutterQuit<cr>", vim.tbl_extend("force", opts, { desc = "Flutter quit" }))
					vim.keymap.set("n", "<leader>FR", "<cmd>FlutterRestart<cr>", vim.tbl_extend("force", opts, { desc = "Flutter restart" }))
					vim.keymap.set("n", "<leader>Fh", "<cmd>FlutterReload<cr>", vim.tbl_extend("force", opts, { desc = "Flutter hot reload" }))
					vim.keymap.set("n", "<leader>Fd", "<cmd>FlutterDevices<cr>", vim.tbl_extend("force", opts, { desc = "Flutter devices" }))
					vim.keymap.set("n", "<leader>Fe", "<cmd>FlutterEmulators<cr>", vim.tbl_extend("force", opts, { desc = "Flutter emulators" }))
					vim.keymap.set("n", "<leader>Fo", "<cmd>FlutterOutlineToggle<cr>", vim.tbl_extend("force", opts, { desc = "Flutter outline toggle" }))
					vim.keymap.set("n", "<leader>Ft", "<cmd>FlutterDevTools<cr>", vim.tbl_extend("force", opts, { desc = "Flutter dev tools" }))
					vim.keymap.set("n", "<leader>Fc", "<cmd>FlutterCopyProfilerUrl<cr>", vim.tbl_extend("force", opts, { desc = "Flutter copy profiler URL" }))
				end,
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
				settings = {
					showTodos = true,
					completeFunctionCalls = true,
					analysisExcludedFolders = {
						vim.fn.expand("$HOME/.pub-cache"),
					},
					renameFilesWithClasses = "prompt",
					enableSnippets = true,
					updateImportsOnRename = true,
				},
			},
		})
	end,
}

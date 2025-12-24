return {
	"folke/flash.nvim",
	event = "VeryLazy",
	---@type Flash.Config
	opts = {
		modes = {
			search = {
				enabled = true,
			},
			-- char = {
			--   jump_labels = true,
			-- },
		},
	},
  -- stylua: ignore
  keys = {
    { "<leader>h", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
    { "<c-h>",     mode = { "c" },           function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
}

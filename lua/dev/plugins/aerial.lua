return {
  "stevearc/aerial.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>a", "<cmd>AerialToggle!<cr>", desc = "Toggle aerial (outline)" },
    { "{", "<cmd>AerialPrev<cr>", desc = "Prev symbol" },
    { "}", "<cmd>AerialNext<cr>", desc = "Next symbol" },
  },
  opts = {
    layout = {
      min_width = 30,
      default_direction = "right",
    },
    attach_mode = "global",
    filter_kind = false,
    show_guides = true,
    guides = {
      mid_item = "├─",
      last_item = "└─",
      nested_top = "│ ",
      whitespace = "  ",
    },
  },
}

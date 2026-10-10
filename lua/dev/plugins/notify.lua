return {
  "rcarriga/nvim-notify",
  opts = {
    timeout = 3000,
    stages = "fade",
    render = "compact",
    max_width = 50,
  },
  config = function(_, opts)
    local notify = require("notify")
    notify.setup(opts)
    vim.notify = notify
  end,
}

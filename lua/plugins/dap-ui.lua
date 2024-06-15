return {
  "rcarriga/nvim-dap-ui",
  config = function()
    -- Override the default settings to prevent automatic opening and closing of windows,
    -- as this can be noisy when debugging with a watchdog.
    local dapui = require("dapui")
    dapui.setup()
  end,
}

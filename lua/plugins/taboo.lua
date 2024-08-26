return {
  dir = "~/repos/taboo.nvim",
  --"TeddyRandby/taboo.nvim",
  config = function()
    local taboo = require "taboo"

    taboo.setup {
      components = {
        "new",
        "clide",
        "lazygit",
        "dapui",
        "shell",
      },
      launchers = {
        clide = taboo.launcher("clide", { insert = true, term = true }),
      },
      icons = {
        clide = "󰅏",
      },
    }
  end,
}

return {
  -- dir = "~/repos/taboo.nvim",
  "TeddyRandby/taboo.nvim",
  config = function()
    local taboo = require "taboo"

    taboo.setup {
      components = {
        "new",
        "clide",
        "lazygit",
        "shell",
      },
      launchers = {
        clide = taboo.launcher("clide", { term = true }),
      },
      icons = {
        clide = "󰅏",
      },
      settings = {
        clide = { insert = true },
      },
    }
  end,
}

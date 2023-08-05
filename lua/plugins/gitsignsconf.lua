return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signcolumn = false,
      signs = {
        add = { text = require('utils.symbol_map').GitAdd },
        change = { text = require('utils.symbol_map').GitChange },
        delete = { text = require('utils.symbol_map').GitDelete },
        topdelete = { text = require('utils.symbol_map').GitTopDelete },
        changedelete = { text = require('utils.symbol_map').GitChangeDelete },
        untracked = { text = require('utils.symbol_map').GitUntracked },
      },
      numhl = false,
      linehl = false,
      word_diff = false,
      keymaps = {},
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      attach_to_untracked = true,
      current_line_blame = false,
      sign_priority = 6,
      update_debounce = 150,
      status_formatter = nil,
      max_file_length = 40000,
      yadm = {
        enable = false,
      },
    },
  },
}

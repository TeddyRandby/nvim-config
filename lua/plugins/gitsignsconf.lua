return {
  {
    "lewis6991/gitsigns.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    opts = {
      signcolumn = true,
      signs = {
        add = { text = require('utils').GitAdd },
        change = { text = require('utils').GitChange },
        delete = { text = require('utils').GitDelete },
        topdelete = { text = require('utils').GitTopDelete },
        changedelete = { text = require('utils').GitChangeDelete },
        untracked = { text = require('utils').GitUntracked },
      },
      numhl = false,
      linehl = false,
      word_diff = false,
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
      trouble = true,
    },
  },
}

local ok, gitsigns = pcall(require, "gitsigns")

if not ok then
  return
end

gitsigns.setup {
  signcolumn = true,
  numhl = false,
  linehl = false,
  word_diff = false,
  keymaps = {},
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = true,
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = "right_align",
    delay = 1000,
  },
  current_line_blame_formatter_opts = {
    relative_time = false,
  },
  current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
  sign_priority = 6,
  update_debounce = 150,
  status_formatter = nil,
  max_file_length = 40000,
  preview_config = {
    border = "single",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
  yadm = {
    enable = false,
  },
}

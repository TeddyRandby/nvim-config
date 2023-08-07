local M = {}

M.keymaps = {
  ScrollUp = "<c-u",
  ScrollDown = "<c-d>",
  SelectNext = "<c-j>",
  SelectPrev = "<c-k>",
  LeaveInsert = "jk",
  Select = "<tab>",
  Expand = "<cr>",
  Delete = "x",
  Quit = "q",
}

M.icons = {
  -- OTHER
  Copilot = " 󱙺 ",
  Text = " 󱔏 ",
  Method = "  ",
  Function = " 󰊕 ",
  Constructor = "  ",
  Field = "  ",
  Variable = "  ",
  Class = "  ",
  Interface = "  ",
  Module = " 󰘦 ",
  Property = "  ",
  Unit = " 󰊱 ",
  Enum = "  ",
  Keyword = "  ",
  Snippet = " 󰅴 ",
  Color = "  ",
  File = "  ",
  Folder = "  ",
  Reference = "  ",
  EnumMember = "  ",
  Constant = "  ",
  Struct = "  ",
  Operator = "  ",
  TypeParameter = "  ",
  Namespace = "  ",
  Package = "  ",
  String = "  ",
  Number = "  ",
  Boolean = "  ",
  Array = "  ",
  Object = "  ",
  Key = "  ",
  Null = " 󰟢 ",
  Event = "  ",
  -- OTHER
  Robot = " 󱙺 ",
  Telescope = " 󰭎 ",
  Search = "  ",
  Shell = "  ",
  Edit = " 󱇧 ",
  Move = " 󰪹 ",
  Filter = " 󰈲 ",
  Help = "  ",
  Selection = "   ",
  Entry = "   ",
  Command = "  ",
  MiddleSeparator = "  ",
  LeftSeparator = "  ",
  RightSeparator = "  ",
  LeftSeparatorSolid = "",
  RightSeparatorSolid = "",
  Empty = "󰝦 ",
  Stopped = "󰙧 ",
  Error = "󰅚 ",
  Warning = "󰗖 ",
  Info = "󰰅 ",
  Hint = "󰰅 ",
  Git = " 󰊢 ",
  GitAdd = "┃",
  GitChange = "┃",
  GitDelete = "",
  GitTopDelete = "",
  GitChangeDelete = "󰜥 ",
  GitUntracked = "",
  Uninstalled = "󰄱 ",
  Installed = "󰡖 ",
  Pending = "󰄗 ",
  Chat = "󰭹 ",
  Tab = "󰓩 ",
}

M.signs = {
  Error = { text = M.icons.Error, texthl = "DiagnosticError" },
  Warn = { text = M.icons.Warning, texthl = "DiagnosticWarning" },
  Hint = { text = M.icons.Hint, texthl = "DiagnosticHint" },
  Info = { text = M.icons.Info, texthl = "DiagnosticInfo" },
  DapStopped = { text = M.icons.Stopped, texthl = "DiagnosticHint" },
  DapBreakpoint = { text = M.icons.Empty, texthl = "DiagnosticOk" },
  DapBreakpointConditional = { text = M.icons.Warning, texthl = "DiagnosticWarning" },
  DapBreakpointRejected = { text = M.icons.Error, texthl = "DiagnosticError" },
}

M.build_term = function(cmd)
  return {
    cmd = cmd,
    hidden = true,
    direction = "float",
    highlights = {
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
    },
    float_opts = {
      border = "solid",
    },
  }
end

M.build_qpicker = function(opts)
  return vim.tbl_extend("force", {
    initial_mode = "normal",
  }, opts)
end

M.build_picker = function(opts)
  return vim.tbl_extend("force", {
    initial_mode = "insert",
  }, opts)
end

return M

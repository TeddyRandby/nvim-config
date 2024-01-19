local M = {}

M.keymaps = {
  ScrollUp = "<C-u>",
  ScrollDown = "<C-d>",
  SelectNextInsert = "<C-j>",
  SelectPrevInsert = "<C-k>",
  SelectNext = "j",
  SelectPrev = "k",
  LeaveInsert = "jk",
  Select = "<tab>",
  Expand = "<cr>",
  DeleteNormal = "x",
  QuitNormal = "q"
}

M.icons = {
  -- OTHER
  Codeium = " 󱙺 ",
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
  Selection = " ",
  Entry = " ",
  Lua = "",
  Telescope="",
  SearchDown=" ",
  SearchUp=" ",
  Shell="",
  Edit="󱇧",
  Move="󰪹",
  Filter="󰈲",
  Help="",
  Command="",
  Git="󰊢",
  Tab="󰓩",
  MiddleSeparator = "  ",
  LeftSeparator = "",
  RightSeparator = "",
  LeftSeparatorSolid = "",
  RightSeparatorSolid = "",
  Empty = "󰝦 ",
  Selected = "󰙧 ",
  Error = "󰅚 ",
  Warning = "󰗖 ",
  Info = "󰰅 ",
  Hint = "󰰅 ",
  -- GITSITNGS
  GitAdd = "┃",
  GitChange = "┃",
  GitDelete = "",
  GitTopDelete = "",
  GitChangeDelete = "󰜥 ",
  GitUntracked = "",
  -- MESON
  Uninstalled = "󰄱 ",
  Installed = "󰡖 ",
  Pending = "󰄗 ",
  Chat = "󰭹 ",
  Removed = " ",
  Changed = " ",
  Added = " ",
}

M.signs = {
  Error = { text = M.icons.Error, texthl = "DiagnosticError" },
  Warn = { text = M.icons.Warning, texthl = "DiagnosticWarning" },
  Hint = { text = M.icons.Hint, texthl = "DiagnosticHint" },
  Info = { text = M.icons.Info, texthl = "DiagnosticInfo" },
  DapStopped = { text = M.icons.Selected, texthl = "DiagnosticHint" },
  DapBreakpoint = { text = M.icons.Empty, texthl = "DiagnosticOk" },
  DapBreakpointConditional = { text = M.icons.Warning, texthl = "DiagnosticWarning" },
  DapBreakpointRejected = { text = M.icons.Error, texthl = "DiagnosticError" },
}

M.build_term = function(cmd, dir)
  return {
    cmd = cmd,
    hidden = true,
    direction = dir or "tab",
    size = function()
      return vim.o.columns
    end,
    highlights = {
      NormalFloat = { link = "NormalFloat" },
      FloatBorder = { link = "FloatBorder" },
    },
    close_on_exit = true,
    on_create = function()
      vim.api.nvim_create_autocmd("BufLeave", { buffer = 0, command = ":q" })
    end,
    on_exit = function(_, _, exit_code, name)
      if exit_code ~= 0 then
        vim.notify(name .. " exited with code " .. exit_code, vim.log.levels.ERROR)
      end
    end,
  }
end

M.build_qpicker = function(opts)
  return vim.tbl_deep_extend("force", {
    initial_mode = "normal",
  }, opts)
end

M.build_picker = function(opts)
  return vim.tbl_deep_extend("force", {
    initial_mode = "insert",
  }, opts)
end

return M

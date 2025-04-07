local M = {}

M.strtruncate = function(str, len, replace)
  replace = replace or "..."
  str = vim.trim(str or "")

  if #str > (len + #replace) then
    return vim.fn.strcharpart(str, 0, len - #replace) .. replace
  end

  return str or ""
end

M.BorderStyle = "rounded"

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
  Telescope = "",
  SearchDown = " ",
  SearchUp = " ",
  Shell = "",
  Edit = "󱇧",
  Move = "󰪹",
  Filter = "",
  Help = "",
  Command = "",
  Git = "󰊢",
  Tab = "󰓩",
  MiddleSeparator = "  ",
  LeftSeparator = "",
  RightSeparator = "",
  LeftSeparatorSolid = "",
  RightSeparatorSolid = "",
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
  Config = "",
  Init = " ",
  Keys = " ",
  Lazy = "󰒲 ",
  Plugin = " ",
  Runtime = " ",
  Source = " ",
  Start = "",
  Task = "✔ ",
  -- LAZY
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

M.lsp_groups = function()
  local lsp_groups = {
    "@lsp.type.string",
    "@lsp.type.method",
    "@lsp.type.function",
    "@lsp.type.function",
    "@lsp.type.property",
    "@variable",
    "@lsp.type.class",
    "@lsp.type.interface",
    "@module",
    "@lsp.type.property",
    "@lsp.type.unit",
    "@variable",
    "@lsp.type.enum",
    "@lsp.type.keyword",
    "@lsp.type.builtin",
    "@lsp.type.keyword",
    "@lsp.type.keyword",
    "@lsp.type.keyword",
    "@lsp.type.keyword",
    "@lsp.type.enumMember",
    "@constant",
    "@lsp.type.struct",
    "@lsp.type.event",
    "@lsp.type.operator",
    "@lsp.type.typeParameter",
  }

  return vim.tbl_map(function(name)
    if not name then
      return ""
    end

    local hl = vim.api.nvim_get_hl(0, { name = name, link = false })
    local hl_name = name .. ".icon"
    vim.api.nvim_set_hl(0, hl_name, { bold = true, fg = "bg", bg = hl.fg })

    return hl_name
  end, lsp_groups)
end

M.lsp_icons = {
  M.icons.Text,
  M.icons.Method,
  M.icons.Function,
  M.icons.Constructor,
  M.icons.Field,
  M.icons.Variable,
  M.icons.Class,
  M.icons.Interface,
  M.icons.Module,
  M.icons.Property,
  M.icons.Unit,
  M.icons.Variable,
  M.icons.Enum,
  M.icons.Keyword,
  M.icons.Snippet,
  M.icons.Color,
  M.icons.File,
  M.icons.Reference,
  M.icons.Folder,
  M.icons.EnumMember,
  M.icons.Constant,
  M.icons.Struct,
  M.icons.Event,
  M.icons.Operator,
  M.icons.TypeParamete
}

M.build_term = function(cmd, title)
  title = title or cmd
  return function()
    local bid = vim.api.nvim_create_buf(false, true)
    assert(bid ~= 0, "Failed to create buffer")

    local wid = vim.api.nvim_open_win(bid, true, {
      relative = 'editor',
      col = vim.fn.floor(vim.o.columns * 0.1),
      row = vim.fn.floor(vim.o.lines * 0.1),
      width = vim.fn.floor(vim.o.columns * 0.8),
      height = vim.fn.floor(vim.o.lines * 0.8),
      border = M.BorderStyle,
      style = "minimal",
      title = title,
      title_pos = "center",
    })
    assert(wid ~= 0, "Failed to create window")

    local close_window = function() vim.api.nvim_win_close(wid, true) end

    vim.api.nvim_create_autocmd("BufLeave", { buffer = 0, command = ":q" })

    local jid = vim.fn.termopen(cmd, {
      on_exit = close_window,
      on_stderr = function(_, data)
        vim.notify_once(data, vim.log.levels.ERROR)
      end
    })
    assert(jid ~= 0, "Failed to open job")

    vim.cmd [[ startinsert ]]
  end
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

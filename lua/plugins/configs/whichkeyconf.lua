local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

wk.setup {
  window = {
    border = "none", -- none, single, double, shadow
    position = "bottom", -- bottom, top
    margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    winblend = 0,
  },
  layout = {
    height = { min = 4, max = 25 }, -- min and max height of the columns
    width = { min = 20, max = 50 }, -- min and max width of the columns
    spacing = 4, -- spacing between columns
    align = "center", -- align columns left, center or right
  },
}

local opts = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
  nowait = true,
}

local v_opts = {
  mode = "v",
  prefix = "<leader>",
  silent = true,
  noremap = true,
  nowait = true,
}

wk.register({
  ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "[COMMENT] Block" }
}, v_opts)

wk.register({
  ["c"] = { "<cmd>bd<cr>", "[BUFFER] Close" },

  ["h"] = { "<cmd>noh<cr>", "[HIGHLIGHT] Clear" },

  ["/"] = { "<Plug>(comment_toggle_linewise_current)", "[COMMENT] Line" },

  [";"] = { "<cmd>Alpha<cr>", "[HOME]" },

  ["e"] = { "<cmd>NnnExplorer<cr>", "[EXPLORER] Open" },

  ["q"] = { "<cmd>wq!<cr>", "[QUIT]" },

  -- [[Illuminate]]
  ["i"] = {
    name = "[ILLUMINATE]",
    j = { "<cmd>lua require'illuminate'.next_reference{wrap=true}<cr>", "Next" },
    k = {
      "<cmd>lua require'illuminate'.next_reference{reverse=true,wrap=true}<cr>", "Prev",
    }
  },

  ["F"] = {
    "<cmd>Telescope find_files hidden=true no_ignore=true<cr>", "[FIND] File"
  },

  ["G"] = {
    "<cmd>Telescope live_grep<cr>", "[FIND] Grep"
  },

  ["O"] = {
    "<cmd>Telescope oldfiles<cr>", "[FIND] Recents"
  },

  ["M"] = {
    "<cmd>Telescope marks<cr>", "[FIND] Marks"
  },

  -- [[ Gitsigns ]]
  ["g"] = {
    name = "[GITSIGNS]",
    -- Helpers
    s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
    h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
    d = { "<cmd>Gitsigns diffthis<cr>", "Show diff" },
    -- Git Pickers
    B = { "<cmd>Telescope git_branches<cr>", "Branches" },
    S = { "<cmd>Telescope git_status<cr>", "Status" },
  },

  -- [[ LSP ]]
  ["l"] = {
    name = "[LSP]",
    -- Diagnostiscs
    e = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Preview diagnostic" },
    j = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
    k = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
    -- LSP specifics
    a = { "<cmd>Lspsaga code_action<cr>", "Code action" },
    f = { "<cmd>lua vim.lsp.buf.format{ async = true}<cr>", "Format" },
    r = { "<cmd>Lspsaga rename<cr>", "Rename" },
    h = { "<cmd>Lspsaga hover_doc<cr>", "Hover" },
    -- LSP Pickers
    R = { "<cmd>Telescope lsp_references<cr>", "References" },
    I = { "<cmd>Telescope lsp_implementations<cr>", "Implementations" },
    D = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
    T = { "<cmd>Telescope lsp_type_definitions<cr>", "Type Definitions" },
    S = { "<cmd>Telescope lsp_document_symbols<cr>", "Symbols" },
    E = { "<cmd>Telescope diagnostics<cr>", "Diagnostics" },
  }
}, opts)

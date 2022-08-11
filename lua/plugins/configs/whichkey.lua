local ok, wk = pcall(require, "which-key")

if not ok then
  return
end

wk.setup {}

local opts = {
  mode = "n",
  prefix = "<leader>",
  silent = true,
  noremap = true,
  nowait = true,
}

wk.register({
  ["c"] = { "<cmd>bd<cr>", "[BUFFER] Close" },

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
    f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
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

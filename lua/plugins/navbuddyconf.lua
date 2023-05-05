return {
  "SmiteshP/nvim-navbuddy",
  dependencies = {
    "neovim/nvim-lspconfig",
    "SmiteshP/nvim-navic",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    window = {
      size = "75%",
      position = "50%",
      border = "single",
      sections = {
        left = {
          size = "30%",
        },
        mid = {
          size = "30%",
        },
        right = {
          preview = "leaf",
        },
      },
    },
    icons = require("utils.symbol_map"),
    lsp = {
      auto_attach = true, -- If set to true, you don't need to manually use attach function
      preference = nil, -- list of lsp server names in order of preference
    },
    source_buffer = {
      follow_node = true, -- Keep the current node in focus on the source buffer
      highlight = true, -- Highlight the currently focused node
      reorient = "smart", -- "smart", "top", "mid" or "none"
    },
  },
}

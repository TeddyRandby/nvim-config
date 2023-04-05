return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup({
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
      })

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
        ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "[COMMENT] Block" },
        ["r"] = { "<cmd>lua require'lute'.run_selection()<cr>", "[RUN]"}
      }, v_opts)

      wk.register({
        ["c"] = { "<cmd>bd<cr>", "[BUFFER] Close" },

        ["q"] = { "<cmd>q<cr>", "[QUIT]" },

        ["h"] = { "<cmd>noh<cr>", "[HIGHLIGHT] Clear" },

        ["/"] = { "<Plug>(comment_toggle_linewise_current)", "[COMMENT] Line" },

        [";"] = { "<cmd>Alpha<cr>", "[HOME]" },

        ["m"] = { "<cmd>Mason<cr>", "[MASON]" },

        ["z"] = { "<cmd>Lazy<cr>", "[LAZY]" },

        ["t"] = { "<cmd>TroubleToggle<cr>", "[TROUBLE]" },

        ["a"] = { "<cmd>Navbuddy<cr>", "[NAV]" },

        -- FINDERS
        ["S"] = {
          "<cmd>Telescope lsp_document_symbols<cr>",
          "Symbols",
        },

        ["D"] = {
          "<cmd>Telescope lsp_definitions<cr>",
          "Definitions",
        },

        ["E"] = {
          "<cmd>Telescope diagnostics<cr>",
          "Diagnostics",
        },

        ["R"] = {
          "<cmd>Telescope lsp_references<cr>",
          "References",
        },

        ["T"] = {
          "<cmd>Telescope<cr>",
          "[FIND] Builtin",
        },

        ["F"] = {
          "<cmd>Telescope find_files hidden=true no_ignore=true<cr>",
          "[FIND] File",
        },

        ["G"] = {
          "<cmd>Telescope live_grep<cr>",
          "[FIND] Grep",
        },

        ["O"] = {
          "<cmd>Telescope oldfiles<cr>",
          "[FIND] Recents",
        },

        ["M"] = {
          "<cmd>Telescope marks<cr>",
          "[FIND] Marks",
        },

        ["W"] = {
          "<cmd>Telescope grep_string<cr>",
          "[FIND] Word",
        },

        -- LSP
        ["l"] = {
          name = "[LSP]",
          -- Diagnostiscs
          ["e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Preview diagnostic" },
          ["j"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
          ["k"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
          -- LSP specifics
          -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
          ["a"] = { "<cmd>CodeActionMenu<cr>", "Code action" },
          ["f"] = { "<cmd>lua vim.lsp.buf.format{ async = true}<cr>", "Format" },
          ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          ["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
          ["i"] = { "<cmd>LspInfo<cr>", "Info" },
        },

        -- Gitsigns
        ["g"] = {
          name = "[GITSIGNS]",
          -- Helpers
          s = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
          h = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
          d = { "<cmd>Gitsigns diffthis<cr>", "Show diff" },
          b = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },
          -- Git Pickers
          B = { "<cmd>Telescope git_branches<cr>", "Branches" },
          S = { "<cmd>Telescope git_status<cr>", "Status" },
        },

        ["r"] = {
          name = "[RUN]",

          f = { "<cmd> lua require'lute'.run_file()<cr>", "File" },
          a = { "<cmd> lua require'lute'.again()<cr>", "Again" },
        },

        -- Dap
        ["d"] = {
          name = "[DAP]",

          ["c"] = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
          ["o"] = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
          ["i"] = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
          ["a"] = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
          ["b"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },

          ["r"] = { "<cmd>lua require('dap').repl.open()<cr>", "Toggle breakpoint" },

          ["h"] = { "<cmd>lua require('dap.ui.widgets').hover()", "Hover" },

          ["p"] = { "<cmd>lua require('dap.ui.widgets').preview()", "Preview" },

          ["f"] = { "<cmd>lua require('dap.ui.widgets').frames()", "Frames" },

          ["s"] = { "<cmd>lua require('dap.ui.widgets').scopes()", "Scopes" },
        },
      }, opts)
    end,
  },
}

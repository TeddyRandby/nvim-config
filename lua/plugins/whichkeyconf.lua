return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      wk.setup({
        window = {
          border = "none",          -- none, single, double, shadow
          position = "bottom",      -- bottom, top
          margin = { 1, 0, 1, 0 },  -- extra window margin [top, right, bottom, left]
          padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 }, -- min and max height of the columns
          width = { min = 20, max = 50 }, -- min and max width of the columns
          spacing = 4,                    -- spacing between columns
          align = "center",               -- align columns left, center or right
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
        ["/"] = { "<Plug>(comment_toggle_linewise_visual)", "Comment" },
        ["r"] = {
          name = "[ROBOT]",
          ["e"] = { "<cmd>ChatGPTRun explain_code<cr>", "Explain" },
          ["a"] = { "<cmd>ChatGPTRun code_readability_analysis<cr>", "Analyze Readability" },
          ["i"] = { "<cmd>ChatGPTEditWithInstructions<cr>", "Edit Interactively" },
        },
        ["d"] = {
          name = "[DAP]",
          ["h"] = { "<cmd>lua require('dapui').elements.watches.add()<cr>", "Hover" },
        },
      }, v_opts)

      wk.register({
        ["c"] = { "<cmd>bd<cr>", "[BUFFER] Close" },

        ["q"] = { "<cmd>q<cr>", "[QUIT]" },

        ["e"] = { "<cmd>noh<cr>", "[HIGHLIGHTS] Clear" },

        ["/"] = { "<Plug>(comment_toggle_linewise_current)", "[COMMENT] Line" },

        [";"] = { "<cmd>Alpha<cr>", "[HOME]" },

        ["t"] = { "<cmd>TroubleToggle<cr>", "[TROUBLE]" },

        ["y"] = { "<cmd>Mason<cr>", "[MASON]" },

        ["z"] = { "<cmd>Lazy<cr>", "[LAZY]" },

        ["m"] = {
          name = "[MARKS]",
          ["c"] = { "<cmd>delmarks!<cr>", "Clear" },
          ["M"] = { "<cmd>Telescope marks<cr>", "[FIND] Marks" },
        },

        ["s"] = {
          name = "[SHELL]",
          ["o"] = { "<cmd>terminal<cr>", "Open" },
          ["r"] = { "<cmd><cr>", "Run" },
        },

        ["f"] = {
          name = "[FILE]",

          -- Finders
          ["F"] = { "<cmd>Telescope find_files hidden=true<cr>", "[FIND] File" },
          ["O"] = { "<cmd>Telescope oldfiles<cr>", "[FIND] Recent" },
          ["B"] = { "<cmd>Telescope buffers<cr>", "[FIND] Buffers" },
          ["W"] = { "<cmd>Telescope live_grep<cr>", "[FIND] Word" },
        },

        -- The Robot
        ["r"] = {
          name = "[ROBOT]",
          ["c"] = { "<cmd>ChatGPT<cr>", "Chat" },
        },

        -- TREEPIN
        ["p"] = {
          name = "[PIN]",

          ["a"] = { "<cmd>TPRoot<cr>", "Pin root" },
          ["j"] = { "<cmd>TPGrow<cr>", "Grow" },
          ["k"] = { "<cmd>TPShrink<cr>", "Shrink" },
          ["g"] = { "<cmd>TPGo<cr>", "Go" },
          ["t"] = { "<cmd>TPToggle<cr>", "Toggle" },
        },

        -- LSP
        ["l"] = {
          name = "[LSP]",

          ["e"] = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Preview diagnostic" },
          ["j"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
          ["k"] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
          ["a"] = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code action" },
          ["f"] = { "<cmd>lua vim.lsp.buf.format{ async = true}<cr>", "Format" },
          ["r"] = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
          ["h"] = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
          ["i"] = { "<cmd>LspInfo<cr>", "Info" },

          -- Finders
          ["R"] = { "<cmd>Telescope lsp_references<cr>", "[FIND] Reference" },
          ["D"] = { "<cmd>Telescope lsp_definitions<cr>", "[FIND] Definition" },
          ["I"] = { "<cmd>Telescope lsp_implementations<cr>", "[FIND] Implementation" },
          ["S"] = { "<cmd>Telescope lsp_document_symbols<cr>", "[FIND] Symbol" },
          ["E"] = { "<cmd>Telescope diagnostics<cr>", "[FIND] Diagnostics" },
        },

        -- Git
        ["g"] = {
          name = "[GITSIGNS]",

          -- Helpers
          ["s"] = { "<cmd>Gitsigns toggle_signs<cr>", "Toggle signs" },
          ["h"] = { "<cmd>Gitsigns preview_hunk<cr>", "Preview hunk" },
          ["d"] = { "<cmd>Gitsigns diffthis<cr>", "Show diff" },
          ["b"] = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },

          -- Finders
          ["B"] = { "<cmd>Telescope git_branches<cr>", "[FIND] Branches" },
          ["S"] = { "<cmd>Telescope git_status<cr>", "[FIND] Status" },
        },

        -- Dap
        ["d"] = {
          name = "[DAP]",

          ["c"] = {
            "<cmd>DapLoadLaunchJSON<cr><cmd>DapContinue<cr>",
            "Continue",
          },
          ["o"] = { "<cmd>DapStepOver<cr>", "Step over" },
          ["i"] = { "<cmd>DapStepInto<cr>", "Step into" },
          ["a"] = { "<cmd>DapStepOut<cr>", "Step out" },

          ["b"] = { "<cmd>DapToggleBreakpoint<cr><cmd>lua require('dapui').open()<cr>", "Toggle breakpoint" },

          ["h"] = { [[<cmd>lua require('dapui').elements.watches.add()<cr><cmd>lua require('dapui').open()<cr>]], "Hover" },
          ["u"] = { "<cmd>lua require('dapui').toggle { layout = 1 }<cr>", "UI" },

          ["C"] = {
            "<cmd>DapLoadLaunchJSON<cr><cmd>Telescope dap configurations<cr>",
            "[FIND] Configurations",
          },
          ["B"] = {
            "<cmd>Telescope dap list_breakpoints<cr>",
            "[FIND] Breakpoints",
          },
        },
      }, opts)
    end,
  },
}

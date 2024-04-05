return {
  {
    "folke/which-key.nvim",
    config = function()
      local wk = require("which-key")

      local builder = require("utils").build_term

      local lg = builder("lazygit")
      local sh = builder(vim.o.shell)
      local cl = builder("clide")

      wk.setup({
        window = {
          border = "none",
          position = "bottom",
          margin = { 1, 0, 1, 0 },
          padding = { 2, 2, 2, 2 },
          winblend = 0,
        },
        layout = {
          height = { min = 4, max = 25 },
          width = { min = 20, max = 50 },
          spacing = 4,
          align = "center",
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
        ["d"] = {
          name = "[DAP]",
          ["h"] = { "<cmd>lua require('dapui').elements.watches.add()<cr>", "Hover" },
        },
      }, v_opts)

      wk.register({
        ["v"] = { function() lg() end, "[LAZYGIT]" },

        ["c"] = { function() cl() end, "[CLIDE]" },

        ["s"] = { function() sh() end, "[SHELL]" },

        ["y"] = { "<cmd>Mason<cr>", "[MASON]" },

        ["z"] = { "<cmd>Lazy<cr>", "[LAZY]" },

        ["d"] = { "<cmd>lua require('dapui').toggle() <cr>", "[DEBUG]" },

        ["/"] = { "<Plug>(comment_toggle_linewise_current)", "[COMMENT] Line" },

        [";"] = { "<cmd>Alpha<cr>", "[HOME]" },

        ["t"] = { "<cmd>TroubleToggle<cr>", "[TROUBLE]" },

        ["f"] = {
          name = "[FILE]",

          -- Finders
          ["F"] = { "<cmd>Telescope find_files<cr>", "[FIND] File" },
          ["O"] = { "<cmd>Telescope oldfiles<cr>", "[FIND] Recent" },
          ["B"] = { "<cmd>Telescope buffers<cr>", "[FIND] Buffers" },
          ["W"] = { "<cmd>Telescope live_grep<cr>", "[FIND] Word" },
          ["M"] = { "<cmd>Telescope marks<cr>", "[FIND] Marks" },
          ["T"] = { "<cmd>Telescope telescope-tabs list_tabs<cr>", "[FIND] Tabs" },
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
          name = "[GIT]",

          ["h"] = { "<cmd>Gitsigns preview_hunk_inline<cr>", "View hunk" },

          ["j"] = { "<cmd>Gitsigns next_hunk<cr>", "Next hunk" },
          ["k"] = { "<cmd>Gitsigns prev_hunk<cr>", "Previous hunk" },

          ["b"] = { "<cmd>Gitsigns blame_line<cr>", "Blame line" },

          ["B"] = { "<cmd>Telescope git_branches<cr>", "[FIND] Branches" },
          ["S"] = { "<cmd>Telescope git_status<cr>", "[FIND] Status" },
        },

        -- Dap
        ["b"] = {
          name = "[DEBUG]",

          ["c"] = {
            "<cmd>DapLoadLaunchJSON<cr><cmd>DapContinue<cr>",
            "Continue",
          },
          ["j"] = { "<cmd>DapStepOver<cr>", "Step over" },
          ["k"] = { "<cmd>DapStepOut<cr>", "Step out" },
          ["i"] = { "<cmd>DapStepInto<cr>", "Step into" },

          ["b"] = { "<cmd>DapToggleBreakpoint<cr>", "Toggle breakpoint" },

          ["h"] = { "<cmd>lua require('dapui').elements.watches.add()<cr>", "Hover" },

          ["C"] = {
            "<cmd>DapLoadLaunchJSON<cr><cmd>Telescope dap configurations initial_mode=normal<cr>",
            "[FIND] Configurations",
          },
          ["B"] = {
            "<cmd>Telescope dap list_breakpoints initial_mode=normal<cr>",
            "[FIND] Breakpoints",
          },
        },
      }, opts)
    end,
  },
}

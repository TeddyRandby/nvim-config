return {
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "v" },
          {
            "<leader>/",
            "gc",
          },
          {
            "<leader>d",
            group = "[DAP]",
          },
          {
            "<leader>dh",
            "<cmd>lua require('dapui').elements.watches.add()<cr>",
          }
        },
        {
          mode = { "n" },
          { "<leader>/",  "gcc",                                                                                 desc = "[COMMENT] Line", },
          { "<leader>;",  "<cmd>Alpha<cr>",                                                                      desc = "[HOME]",                nowait = true, remap = false },
          { "<leader>b",  group = "[DEBUG]",                                                                     nowait = true,                  remap = false },
          { "<leader>bB", "<cmd>Telescope dap list_breakpoints initial_mode=normal<cr>",                         desc = "[FIND] Breakpoints",    nowait = true, remap = false },
          { "<leader>bC", "<cmd>DapLoadLaunchJSON<cr><cmd>Telescope dap configurations initial_mode=normal<cr>", desc = "[FIND] Configurations", nowait = true, remap = false },
          { "<leader>bb", "<cmd>DapToggleBreakpoint<cr>",                                                        desc = "Toggle breakpoint",     nowait = true, remap = false },
          { "<leader>bc", "<cmd>DapLoadLaunchJSON<cr><cmd>DapContinue<cr>",                                      desc = "Continue",              nowait = true, remap = false },
          { "<leader>bh", "<cmd>lua require('dapui').elements.watches.add()<cr>",                                desc = "Hover",                 nowait = true, remap = false },
          { "<leader>bi", "<cmd>DapStepInto<cr>",                                                                desc = "Step into",             nowait = true, remap = false },
          { "<leader>bj", "<cmd>DapStepOver<cr>",                                                                desc = "Step over",             nowait = true, remap = false },
          { "<leader>bk", "<cmd>DapStepOut<cr>",                                                                 desc = "Step out",              nowait = true, remap = false },
          { "<leader>n",  "<cmd>tabnew<cr>",                                                                     desc = "[TAB+]",                nowait = true, remap = false },
          { "<leader>c",  "<cmd>tabnew term://clide<cr>",                                          desc = "[CLIDE]",               nowait = true, remap = false },
          { "<leader>s",  "<cmd>tabnew term://" .. vim.o.shell .. "<cr>",                          desc = "[SHELL]",               nowait = true, remap = false },
          { "<leader>v",  "<cmd>tabnew term://lazygit<cr>",                                        desc = "[LAZYGIT]",             nowait = true, remap = false },
          { "<leader>d",  "<cmd>lua require('dapui').toggle() <cr>",                                             desc = "[DEBUG]",               nowait = true, remap = false },
          { "<leader>f",  group = "[FILE]",                                                                      nowait = true,                  remap = false },
          { "<leader>fB", "<cmd>Telescope buffers<cr>",                                                          desc = "[FIND] Buffers",        nowait = true, remap = false },
          { "<leader>fF", "<cmd>Telescope find_files<cr>",                                                       desc = "[FIND] File",           nowait = true, remap = false },
          { "<leader>fM", "<cmd>Telescope marks<cr>",                                                            desc = "[FIND] Marks",          nowait = true, remap = false },
          { "<leader>fO", "<cmd>Telescope oldfiles<cr>",                                                         desc = "[FIND] Recent",         nowait = true, remap = false },
          { "<leader>fT", "<cmd>Telescope telescope-tabs list_tabs<cr>",                                         desc = "[FIND] Tabs",           nowait = true, remap = false },
          { "<leader>fW", "<cmd>Telescope live_grep<cr>",                                                        desc = "[FIND] Word",           nowait = true, remap = false },
          { "<leader>g",  group = "[GIT]",                                                                       nowait = true,                  remap = false },
          { "<leader>gB", "<cmd>Telescope git_branches<cr>",                                                     desc = "[FIND] Branches",       nowait = true, remap = false },
          { "<leader>gS", "<cmd>Telescope git_status<cr>",                                                       desc = "[FIND] Status",         nowait = true, remap = false },
          { "<leader>gb", "<cmd>Gitsigns blame_line<cr>",                                                        desc = "Blame line",            nowait = true, remap = false },
          { "<leader>gh", "<cmd>Gitsigns preview_hunk_inline<cr>",                                               desc = "View hunk",             nowait = true, remap = false },
          { "<leader>gj", "<cmd>Gitsigns next_hunk<cr>",                                                         desc = "Next hunk",             nowait = true, remap = false },
          { "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>",                                                         desc = "Previous hunk",         nowait = true, remap = false },
          { "<leader>l",  group = "[LSP]",                                                                       nowait = true,                  remap = false },
          { "<leader>lD", "<cmd>Telescope lsp_definitions<cr>",                                                  desc = "[FIND] Definition",     nowait = true, remap = false },
          { "<leader>lE", "<cmd>Telescope diagnostics<cr>",                                                      desc = "[FIND] Diagnostics",    nowait = true, remap = false },
          { "<leader>lI", "<cmd>Telescope lsp_implementations<cr>",                                              desc = "[FIND] Implementation", nowait = true, remap = false },
          { "<leader>lR", "<cmd>Telescope lsp_references<cr>",                                                   desc = "[FIND] Reference",      nowait = true, remap = false },
          { "<leader>lS", "<cmd>Telescope lsp_document_symbols<cr>",                                             desc = "[FIND] Symbol",         nowait = true, remap = false },
          { "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>",                                              desc = "Code action",           nowait = true, remap = false },
          { "<leader>le", "<cmd>lua vim.diagnostic.open_float()<cr>",                                            desc = "Preview diagnostic",    nowait = true, remap = false },
          { "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true}<cr>",                                      desc = "Format",                nowait = true, remap = false },
          { "<leader>lh", "<cmd>lua vim.lsp.buf.hover()<cr>",                                                    desc = "Hover",                 nowait = true, remap = false },
          { "<leader>li", "<cmd>LspInfo<cr>",                                                                    desc = "Info",                  nowait = true, remap = false },
          { "<leader>lj", "<cmd>lua vim.diagnostic.goto_next()<cr>",                                             desc = "Next diagnostic",       nowait = true, remap = false },
          { "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev()<cr>",                                             desc = "Prev diagnostic",       nowait = true, remap = false },
          { "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>",                                                   desc = "Rename",                nowait = true, remap = false },
          { "<leader>y",  "<cmd>Mason<cr>",                                                                      desc = "[MASON]",               nowait = true, remap = false },
          { "<leader>z",  "<cmd>Lazy<cr>",                                                                       desc = "[LAZY]",                nowait = true, remap = false },
        }
      },
    },
  },
}

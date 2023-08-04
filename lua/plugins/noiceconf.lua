return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      cmdline = {
        format = {
          cd = { kind="cmd", pattern = "^:cd%s+", icon = "󰉋 " },
          edit = { kind="cmd", pattern = "^:ed?i?t?%s+", icon = "󰈔 " },
          man = { kind="cmd", pattern = "^:Man%s+", icon = " " },
          telescope = { kind = "cmd", pattern = "^:Tele?s?c?o?p?e?%s+", icon = "󰭎 " },
          filter = { pattern = { "^:%s*!", "^:'<,'>%s*!" }, icon = "$", lang = "bash" },
          mv = { kind="filter", pattern = ".*mv%s+", icon = "󰪹 " },
          grep = { kind = "filter", pattern = ".*grep%s+", icon = " ", lang="regex" },
          sed = { kind = "filter", pattern = ".*sed%s+", icon = "󱐋 ", lang="regex" },
          tr = { kind = "filter", pattern = ".*tr%s+", icon = "󱐋 ", lang="regex" },
        },
      },
      messages = {
        enabled = false,
        view_error = "notify",
        view_search = "virtualtext"
      },
      popupmenu = {
        enabled = true,
        backend = "cmp",
        kind_icons = false,
      },
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        progress = { enabled = false },
        signature = { enabled = false },
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        command_palette = true,       -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        lsp_doc_border = true,
      },
    },
  },
}

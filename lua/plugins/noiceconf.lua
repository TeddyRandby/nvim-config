return {
  {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      cmdline = {
        format = {
          cmdline = { pattern = "^:", icon = require('utils').icons.Command, lang = "vim" },
          cd = { kind = "cmd", pattern = "^:cd%s+", icon = require('utils').icons.Folder },
          tcd = { kind = "cmd", pattern = "^:tcd%s+", icon = require('utils').icons.Folder },
          edit = { kind = "cmd", pattern = "^:ed?i?t?%s+", icon = require('utils').icons.Edit },
          man = { kind = "cmd", pattern = "^:Man%s+", icon = require('utils').icons.Help, lang = "man" },
          telescope = { kind = "cmd", pattern = "^:Tele?s?c?o?p?e?%s+", icon = require('utils').icons.Telescope },
          chatgpt = { kind = "cmd", pattern = "^:ChatGPTRu?n?%s+", icon = require('utils').icons.Robot },
          tab = { kind = "cmd", pattern = "^:tab%s+", icon = require('utils').icons.Tab },

          filter = { pattern = { "^:%s*!", "^:'<,'>%s*!" }, icon = require('utils').icons.Shell, lang = "bash" },
          git = { pattern = "^:%s*!%s*git%s+", icon = require('utils').icons.Git, lang = "bash" },
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

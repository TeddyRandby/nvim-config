local function format_icon(icon_name)
  return " " .. require('utils').icons[icon_name]
end

return {
  {
    enabled = false,
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    opts = {
      cmdline = {
        format = {
          cmdline = { pattern = "^:", icon = format_icon("Command"), lang = "vim" },
          cd = { kind = "cmd", pattern = "^:cd%s+", icon = format_icon("Folder") },
          tcd = { kind = "cmd", pattern = "^:tcd%s+", icon = format_icon("Folder") },
          edit = { kind = "cmd", pattern = "^:ed?i?t?%s+", icon = format_icon("Edit") },
          help = { kind = "cmd", pattern = "^:he?l?p?%s+", icon = format_icon("Help") },
          man = { kind = "cmd", pattern = "^:Man%s+", icon = format_icon("Help"), lang = "man" },
          telescope = { kind = "cmd", pattern = "^:Tele?s?c?o?p?e?%s+", icon = format_icon("Telescope") },
          tab = { kind = "cmd", pattern = "^:tab+", icon = format_icon("Tab") },
          filter = { pattern = "^:%s*!", icon = format_icon("Filter"), lang = "bash" },
          git = { pattern = "^:%s*!%s*git%s+", icon = format_icon("Git"), lang = "bash" },
          search_down = { kind = "search", pattern = "^/", icon = format_icon("SearchDown"), lang = "regex" },
          search_up = { kind = "search", pattern = "^%?", icon = format_icon("SearchUp"), lang = "regex" },
          lua = { pattern = "^:%s*lua%s+", icon = format_icon("Lua"), lang = "lua" },
        },
      },
      messages = {
        enabled = false,
        view_error = "notify",
        view_search = "virtualtext"
      },
      views = {
        cmdline_popup = {
          relative = "editor",
          position = { row = 3, col = 0.5 },
          size = { width = 0.6 },
          border = {
            style = require('utils').BorderStyle,
          },
        },
      },
      popupmenu = {
        enabled = false,
        backend = "nui",
        kind_icons = false,
      },
      lsp = {
        enabled = false,
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        progress = { enabled = false },
        signature = { enabled = false },
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

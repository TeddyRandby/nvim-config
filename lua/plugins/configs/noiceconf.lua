local ok, noice = pcall(require, "noice")

if not ok then
  return
end

noice.setup {
  messages = {
    view = "mini",
  },
  popupmenu = {
    backend = "cmp",
    kind_icons = false,
  },
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    signature = {
      auto_open = false,
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    lsp_doc_border = "single",
  },
}

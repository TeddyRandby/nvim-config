return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  opts = {
    flavour = "mocha",
    term_colors = true,
    styles = {
      comments = { "italic" },
    },
    default_integrations = true,
    integrations = {
      cmp = true,
      notify = true,
      gitsigns = true,
      treesitter = true,
      alpha = true,
      mason = true,
      noice = true,
      dap = true,
      dap_ui = true,
      telescope = {
        enabled = true,
      },
      lsp_trouble = true,
      which_key = true,
    },
  },
}

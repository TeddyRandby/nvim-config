local function lsp_clients()
  local clients = vim.lsp.get_active_clients({ bufnr = 0 })

  local names = {}

  for _, value in ipairs(clients) do
    table.insert(names, value.name)
  end

  return table.concat(names, require("utils").icons.MiddleSeparator)
end

return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      options = {
        disabled_filetypes = {
          winbar = { "taboo" },
        },
        icons_enabled = true,
        theme = "gruvbox",
        section_separators = {
          left = require("utils").icons.LeftSeparatorSolid,
          right = require("utils").icons.RightSeparatorSolid
        },
        component_separators = {
          left = require("utils").icons.LeftSeparator,
          right = require("utils").icons.RightSeparator
        },
        always_divide_middle = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
        globalstatus = true,
      },
      tabline = {},
      sections = {
        lualine_a = { "mode", "branch" },
        lualine_b = {
          {
            "filetype",
            icon_only = true,
          },
          {
            "filename",
            path = 4,
            file_status = false,
          },
        },
        lualine_c = {
          {
            "diff",
            symbols = {
              added = require("utils").icons.Added,
              modified = require("utils").icons.Changed,
              removed = require("utils").icons.Removed,
            },
          },
          {
            "diagnostics",
            symbols = {
              error = require("utils").icons.Error,
              warn = require("utils").icons.Warning,
              hint = require("utils").icons.Hint,
              info = require("utils").icons.Info,
            },
          },
        },
        lualine_x = {},
        lualine_y = {},
        lualine_z = { lsp_clients },
      },
      inactive_sections = {},
      winbar = {},
      inactive_winbar = {},
    },
    extensions = { "trouble", "nvim-dap-ui", "lazy", "toggleterm", "man" },
  },
}

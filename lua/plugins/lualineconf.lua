return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
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
        globalstatusline = true,
      },
      sections = {
        lualine_a = {
        },
        lualine_b = {
          "branch",
          "diff",
        },
        lualine_c = {
        },
        lualine_x = {
          "diagnostics",
          function()
            local clients = vim.lsp.get_active_clients { bufnr = 0 }
            local names = {}

            for client in pairs(clients) do
              local name = clients[client].name

              table.insert(names, name)
            end

            return table.concat(names, require('utils').icons.MiddleSeparator)
          end,
        },
        lualine_y = {
          "filetype",
        },
        lualine_z = {},
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_z = { "tabs" },
      },
    },
    inactive_sections = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "trouble", "nvim-dap-ui", "lazy", "toggleterm", "man" },
  },
}

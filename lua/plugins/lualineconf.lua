return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      {
        "SmiteshP/nvim-navic",
        opts = {
          icons = require("utils.symbol_map"),
          lsp = { auto_attach = true },
          highlight = true,
          separator = require("utils.symbol_map").LeftSeparator,
          depth_limit = 4,
          safe_output = false,
        },
      },
    },
    opts = {
      options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = {
          left = require("utils.symbol_map").LeftSeparatorSolid,
          right = require("utils.symbol_map").RightSeparatorSolid
        },
        component_separators = {
          left = require("utils.symbol_map").LeftSeparator,
          right = require("utils.symbol_map").RightSeparator
        },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = {
          "branch",
        },
        lualine_b = { "diff" },
        lualine_c = {
          {
            "filename",
            path = 4,
          },
        },
        lualine_x = {
          function()
            local clients = vim.lsp.get_active_clients { bufnr = 0 }
            local names = {}

            for client in pairs(clients) do
              local name = clients[client].name

              table.insert(names, name)
            end

            return table.concat(names, require('utils.symbol_map').MiddleSeparator)
          end,
        },
        lualine_y = {
          {
            "diagnostics",
            symbols = {
              error = require("utils.symbol_map").Error,
              warn = require("utils.symbol_map").Warning,
              info = require("utils.symbol_map").Info,
              hint = require("utils.symbol_map").Hint,
            }
          },
        },
        lualine_z = { "location" },
      },
      inactive_sections = {},
      tabline = {
        lualine_a = {
          {
            padding = 0,
            function()
              return require("nvim-navic").get_location()
            end,
            cond = function()
              return require("nvim-navic").is_available()
            end,
          },
        },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { "trouble" },
    },
  },
}

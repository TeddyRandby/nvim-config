return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "kyazdani42/nvim-web-devicons",
      {
        "SmiteshP/nvim-navic",
        opts = {
          icons = require("utils").icons,
          lsp = { auto_attach = true },
          highlight = true,
          separator = require("utils").icons.LeftSeparator,
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
          left = require("utils").icons.LeftSeparatorSolid,
          right = require("utils").icons.RightSeparatorSolid
        },
        component_separators = {
          left = require("utils").icons.LeftSeparator,
          right = require("utils").icons.RightSeparator
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
        lualine_b = {
          "diff",
        },
        lualine_c = {},
        lualine_x = {
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
          {
            "diagnostics",
            symbols = {
              error = require("utils").icons.Error,
              warn = require("utils").icons.Warning,
              info = require("utils").icons.Info,
              hint = require("utils").icons.Hint,
            }
          },
        },
        lualine_z = { "tabs" },
      },
      inactive_sections = {},
      tabline = {},
      winbar = {
        lualine_b = {
          "filetype",
          {
            "filename",
            path = 4,
          },
        },
        lualine_c = {
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
      inactive_winbar = {
        lualine_c = {
          "filetype",
          {
            "filename",
            path = 4,
          },
        },
      },
      extensions = { "trouble", "nvim-dap-ui", "lazy", "toggleterm", "man" },
    },
  },
}

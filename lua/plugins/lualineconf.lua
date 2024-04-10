return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons" },
    opts = {
      options = {
        icons_enabled = true,
        theme = "catppuccin",
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
        lualine_a = { "branch" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      inactive_sections = {},
      winbar = {
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
      },
      inactive_winbar = {
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
      },
    },
    extensions = { "trouble", "nvim-dap-ui", "lazy", "toggleterm", "man" },
  },
}

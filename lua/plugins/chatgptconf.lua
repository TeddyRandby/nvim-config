local home = vim.fn.expand("$HOME")
local cmd = home .. "/.config/openapikey.sh"
local winhighlight = "Normal:TelescopePreviewNormal,FloatBorder:FloatBorder"
local prompthighlight = "Normal:TelescopePromptNormal,FloatBorder:TelescopePromptBorder"

local border_options = {
  highlight = "FloatBorder",
  text = {},
}

local win_options = {
  winhighlight = winhighlight,
}

return {
  "jackMort/ChatGPT.nvim",
  cevent = "VeryLazy",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    api_key_cmd = cmd,
    chat = {
      sessions_window = {
        border = border_options,
        win_options = win_options,
      },
    },
    settings_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_input = {
      border = {
        highlight = prompthighlight
      },
      win_options = {
        winhighlight = prompthighlight
      },
    },
    system_window = {
      win_options = win_options,
    },
  },
}

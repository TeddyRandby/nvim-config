local home = vim.fn.expand("$HOME")
local cmd = home .. "/.config/openapikey.sh"
local winhighlight = "FloatBorder:FloatBorder"
local prompthighlight = "FloatBorder:TelescopePromptBorder"

local border_options = {
  highlight = "FloatBorder:FloatBorder",
  text = false,
}

local win_options = {
  winhighlight = winhighlight,
}

local keymaps = require('utils').keymaps

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
      keymaps = {
        close = keymaps.Quit,
        select_session = keymaps.Select,
        delete_session = keymaps.Delete,
        scroll_up = keymaps.SelectPrev,
        scroll_down = keymaps.SelectNext,
      },
    },
    settings_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_layout = {
      center = {
        width = "80%",
        height = "80%",
      },
    },
    system_window = {
      win_options = win_options,
    },
    popup_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_input = {
      prompt = " " .. require("utils").icons.Chat,
      border = {
        highlight = prompthighlight,
      },
      win_options = {
        winhighlight = prompthighlight
      },
    },
  },
}

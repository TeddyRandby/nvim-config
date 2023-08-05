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
        close = { "<C-c>", "<esc>", "q" },
        select_session = "<cr>",
        delete_session = "x",
        scroll_up = { "<C-j>", "<up>" },
        scroll_down = { "<C-k>", "<down>" },
      },
    },
    settings_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_layout = {
      center = {
        width = "90%",
        height = "80%",
      },
    },
    popup_window = {
      border = border_options,
      win_options = win_options,
    },
    popup_input = {
      border = {
        highlight = prompthighlight,
        text = false,
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

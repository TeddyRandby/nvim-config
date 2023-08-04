local DEBUG_SERVER_PORT = "42000"

local function meson_executable(name)
  local MESON_BIN_DIR = "~/.local/share/nvim/mason/bin"
  return vim.fn.expand(MESON_BIN_DIR .. "/" .. name)
end

local GO_ADAPTER = {
  type = "server",
  port = DEBUG_SERVER_PORT,
  executable = {
    command = meson_executable("dlv"),
    args = { "dap", "-l", "127.0.0.1:" .. DEBUG_SERVER_PORT },
  },
}

local JS_ADAPTER = {
  type = "executable",
  command = meson_executable("node-debug2-adapter"),
}

local C_ADAPTER = {
  type = "server",
  port = DEBUG_SERVER_PORT,
  executable = {
    command = meson_executable("codelldb"),
    args = { "--port", DEBUG_SERVER_PORT },
  }
}

local adapters = {
  typescript = JS_ADAPTER,
  javascript = JS_ADAPTER,
  node = JS_ADAPTER,

  c = C_ADAPTER,
  cpp = C_ADAPTER,
  codelldb = C_ADAPTER,

  go = GO_ADAPTER,
  dlv = GO_ADAPTER,
  delve = GO_ADAPTER,
}

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "rcarriga/nvim-dap-ui",
      opts = {
        floating = {
          border = "solid",
        },
        mappings = {
          edit = "i",
          expand = { "l", "h" },
          open = "<cr>",
          remove = "x",
          repl = "r",
          toggle = "t"
        },
        layouts = {
          {
            elements = {
              {
                id = "repl",
                size = 0.3,
              },
              {
                id = "console",
                size = 0.7,
              },
            },
            size = .3,
            position = "bottom",
          },
          {
            elements = {
              {
                id = "stacks",
                size = 0.2,
              },
              {
                id = "watches",
                size = 0.6,
              },
              {
                id = "breakpoints",
                size = 0.2,
              },
            },
            size = .2,
            position = "left",
          },
        },
      },
    },
    {
      "theHamsta/nvim-dap-virtual-text",
      opts = {
        enabled = true,                     -- enable this plugin (the default)
        enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
        highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
        highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
        show_stop_reason = true,            -- show stop reason when stopped for exceptions
        commented = false,                  -- prefix virtual text with comment string
        only_first_definition = true,       -- only show virtual text at first definition (if there are multiple)
        all_references = false,             -- show virtual text on all all references of the variable (not only definitions)
        --- A callback that determines how a variable is displayed or whether it should be omitted
        display_callback = function(variable)
          return variable.name .. " = " .. variable.value
        end,

        -- experimental features:
        virt_text_pos = "eol",   -- position of virtual text, see `:h nvim_buf_set_extmark()`
        all_frames = false,      -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
        virt_lines = false,      -- show virtual lines instead of virtual text (will flicker!)
        virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
      },
    },
  },
  config = function()
    local dap = require("dap")

    dap.adapters = vim.tbl_extend("force", dap.adapters, adapters)
  end,
}

local adapters = {
	["node"] = {
		type = "server",
		host = "localhost",
		port = "${port}",
		executable = {
			command = "node",
			args = { "~/.local/share/nvim/mason/bin/node-debug2-adapter", "${port}" },
		},
	},
}

return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				enabled = true, -- enable this plugin (the default)
				enabled_commands = true, -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
				highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
				highlight_new_as_changed = false, -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
				show_stop_reason = true, -- show stop reason when stopped for exceptions
				commented = false, -- prefix virtual text with comment string
				only_first_definition = true, -- only show virtual text at first definition (if there are multiple)
				all_references = false, -- show virtual text on all all references of the variable (not only definitions)
				--- A callback that determines how a variable is displayed or whether it should be omitted
				display_callback = function(variable)
					return variable.name .. " = " .. variable.value
				end,

				-- experimental features:
				virt_text_pos = "eol", -- position of virtual text, see `:h nvim_buf_set_extmark()`
				all_frames = false, -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
				virt_lines = false, -- show virtual lines instead of virtual text (will flicker!)
				virt_text_win_col = nil, -- position the virtual text at a fixed window column (starting from the first text column) ,
				-- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
			},
		},
	},
  config = function ()
    local dap_adapters = require 'dap'.adapters

    for dap, adapter in pairs(adapters) do
      dap_adapters[dap] = adapter
    end
  end,
}

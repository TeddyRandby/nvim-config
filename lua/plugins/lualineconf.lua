return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"kyazdani42/nvim-web-devicons",
			{
				"SmiteshP/nvim-navic",
				opts = {
					icons = require("utils.symbol_map"),
					lsp = {
						auto_attach = true,
					},
					highlight = false,
					separator = "",
				},
			},
		},
		opts = {
			options = {
				icons_enabled = true,
				theme = "dracula-nvim",
				section_separators = { left = "", right = "" },
				component_separators = { left = "", right = "" },
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
				lualine_x = {},
				lualine_y = {
					{
						"diagnostics",
						symbols = { error = "", warn = "", info = "", hint = "" },
					},
				},
				lualine_z = { "location" },
			},
			inactive_sections = {},
			tabline = {
				lualine_b = {
					{
						function()
							return require("nvim-navic").get_location()
						end,
						cond = function()
							return require("nvim-navic").is_available()
						end,
					},
				},
				lualine_z = {
					{
						"buffers",
						mode = 1,
					},
				},
			},
			winbar = {},
			inactive_winbar = {},
			extensions = { "trouble" },
		},
	},
}

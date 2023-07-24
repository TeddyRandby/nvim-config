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
					highlight = true,
					separator = " ",
          depth_limit = 4,
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
				lualine_x = {
          function()
            local clients = vim.lsp.get_active_clients { bufnr = 0 }
            local names = {}

            for client in pairs(clients) do
              local name = clients[client].name

              table.insert(names, name)
            end

            return table.concat(names, "  ")
          end,
        },
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
			},
			winbar = {},
			inactive_winbar = {},
			extensions = { "trouble" },
		},
	},
}

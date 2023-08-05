return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
        width = .8,
        height = .8,
				icons = {
					package_installed = require('utils.symbol_map').Installed,
					package_pending = require('utils.symbol_map').Pending,
					package_uninstalled = require('utils.symbol_map').Uninstalled,
				},
			},
		},
	},
}

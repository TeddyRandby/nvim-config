return {
	{
		"williamboman/mason.nvim",
		opts = {
			ui = {
        width = .8,
        height = .8,
				icons = {
					package_installed = require('utils').icons.Installed,
					package_pending = require('utils').icons.Pending,
					package_uninstalled = require('utils').icons.Uninstalled,
				},
			},
		},
	},
}

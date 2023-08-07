local keymaps = require('utils').keymaps
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
        keymaps = {
          close_window = keymaps.QuitNormal,
          toggle_package_expand = keymaps.Select,
          uninstall_package = keymaps.Delete,
          update_all_packages = "S",
        },
			},
		},
	},
}

return {
	{
		"folke/trouble.nvim",
		dependencies = "kyazdani42/nvim-web-devicons",
		opts = {
      group = true,
      action_keys = {
        ["<C-t>"] = "<cmd>Telescope quickfixlist<cr>",
      },
      signs = {
        error = require("utils").icons.Error,
        warning = require("utils").icons.Warning,
        hint = require("utils").icons.Hint,
        information = require("utils").icons.Info,
      },
    },
	},
}

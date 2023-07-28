return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
		config = function()
			local null_ls = require "null-ls"

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.eslint_d,

					null_ls.builtins.code_actions.eslint_d,

					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.shellcheck,
					null_ls.builtins.diagnostics.fish,
				},
			})
		end,
	},
}

return {
	{
		"jose-elias-alvarez/null-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = { "eslint_d", "shellcheck", "prettier_d" },
        },
      },
		},
    enabled = true,
		config = function()
			local null_ls = require "null-ls"

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,

          null_ls.builtins.code_actions.gitsigns,
					null_ls.builtins.code_actions.eslint_d,

					null_ls.builtins.diagnostics.eslint_d,
					null_ls.builtins.diagnostics.shellcheck,
				},
			})
		end,
	},
}

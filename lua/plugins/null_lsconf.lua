return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = { "prettier_d" },
        },
      },
		},
    enabled = true,
		config = function()
			local null_ls = require "null-ls"

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
				},
			})
		end,
	},
}

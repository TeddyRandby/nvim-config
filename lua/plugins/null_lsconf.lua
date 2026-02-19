return {
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
      {
        "jay-babu/mason-null-ls.nvim",
        opts = {
          ensure_installed = { "prettier_d", "google_java_format", "stylua" },
        },
      },
		},
    enabled = true,
		config = function()
			local null_ls = require "null-ls"

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettierd,
          null_ls.builtins.formatting.google_java_format,
          null_ls.builtins.formatting.stylua,
				},
			})
		end,
	},
}

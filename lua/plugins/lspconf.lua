return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lsp_config = require("lspconfig")

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local utils = require("utils")

			local servers = {
				"bashls",
				"tsserver",
				"clangd",
				"sumneko_lua",
				"prismals",
			}

			for _, server in ipairs(servers) do
				local conf_ok, try_conf = pcall(require, "lsp.servers." .. server)

				local conf = vim.tbl_extend("keep", conf_ok and try_conf or {}, {
					on_attach = function() end,
					flags = {},
					settings = {},
					capabilities = cmp_nvim_lsp.default_capabilities(),
				})

				lsp_config[server].setup(conf)
			end
		end,
	},
}

local lsp_config_ok, lsp_config = pcall(require, "lspconfig")

if not lsp_config_ok then
	return
end

local cmp_nvim_lsp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if not cmp_nvim_lsp_ok then
	return
end

local utils = require("utils")

local servers = {
  "bashls",
  "tsserver",
  "clangd",
  "sumneko_lua",
}

for _, server in ipairs(servers) do
  local conf_ok, try_conf = pcall(require, "lsp.servers." .. server)

  local conf = vim.tbl_extend("keep", conf_ok and try_conf or {}, {
    on_attach = function() end,
    flags = {},
    settings = {},
    capabilities = cmp_nvim_lsp.default_capabilities()
  })

  lsp_config[server].setup(conf)
end

-- Gutter sign icons
for type, icon in pairs(utils.signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Prefix diagnostic virtual text
vim.diagnostic.config({
	float = {
		header = false,
		source = false,
    prefix = "",
    border = "rounded",
	},
	signs = true,
	underline = true,
  virtual_text = false,
	update_in_insert = false,
})


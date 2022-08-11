local ok, lsp_installer = pcall(require, "nvim-lsp-installer")

if not ok then
	return
end

local utils = require("utils")

local servers = {
	"bashls",
	"sumneko_lua",
	"cssls",
	"html",
	"emmet_ls",
	"jsonls",
	"yamlls",
	"dockerls",
	"sumneko_lua",
	"tsserver",
	"clangd",
}

-- Floating border
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or { { " ", "FloatBorder" } }
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local on_attach = function(client)
	require("illuminate").on_attach(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

lsp_installer.setup({
	ensure_installed = servers,
	automatic_installation = true,
	ui = {
		icons = {
			server_installed = "",
			server_pending = "",
			server_uninstalled = "",
		},
	},
})

for _, server in ipairs(servers) do
	require("lsp.servers." .. server).setup(on_attach, capabilities)
end

-- Gutter sign icons
for type, icon in pairs(utils.signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

-- Prefix diagnostic virtual text
vim.diagnostic.config({
	virtual_text = {
		source = "always",
		prefix = " ",
		spacing = 6,
	},
	float = {
		header = false,
		source = "always",
	},
	signs = true,
	underline = false,
	update_in_insert = false,
})

local utils = require("utils")

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


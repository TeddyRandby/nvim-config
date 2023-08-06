local utils = require("utils")

-- Gutter sign icons
for type, sign in pairs(utils.signs) do
	vim.fn.sign_define(type, sign)
end

-- Prefix diagnostic virtual text
vim.diagnostic.config({
	float = {
		header = false,
		source = false,
    prefix = "",
    border = "rounded",
	},
	signs = false,
	underline = true,
  virtual_text = true,
	update_in_insert = false,
})


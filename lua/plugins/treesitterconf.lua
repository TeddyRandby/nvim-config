return {
	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = {
		},
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				highlight = {
					enable = true,
				},
			})

			local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

			parser_config.gab = {
				install_info = {
					url = "https://github.com/TeddyRandby/tree-sitter-gab", -- local path or git repo
					files = { "src/parser.c" },
					-- optional entries:
					branch = "main", -- default branch in case of git repo if different from master
					generate_requires_npm = false, -- if stand-alone parser without npm dependencies
					requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
				},
				filetype = "gab", -- if filetype does not match the parser name
			}
		end,
	},
}

return {
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-dap.nvim",
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			local telescope = require("telescope")

			local trouble = require("trouble.providers.telescope")

			telescope.setup({
				picker = {
					hidden = false,
				},
				extensions = {
					["ui-select"] = { require("telescope.themes").get_dropdown({}) },
				},
				defaults = {
					prompt_prefix = "     ",
					selection_caret = "  ",
					entry_prefix = "   ",
					initial_mode = "insert",
					selection_strategy = "reset",
					sorting_strategy = "ascending",
					layout_strategy = "horizontal",
					layout_config = {
						horizontal = {
							prompt_position = "top",
							preview_width = 0,
							results_width = 0.8,
						},
						vertical = {
							mirror = true,
						},
						width = 0.80,
						height = 0.85,
					},
					file_sorter = require("telescope.sorters").get_fuzzy_file,
					file_ignore_patterns = { "node_modules", ".git/", "dist/" },
					generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
					path_display = { "absolute" },
					winblend = 0,
					color_devicons = true,
					use_less = true,
					set_env = { ["COLORTERM"] = "truecolor" },
					file_previewer = require("telescope.previewers").vim_buffer_cat.new,
					grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
					qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
					buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
					mappings = {
						i = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
							["<C-t>"] = trouble.open_with_trouble,
						},
						n = {
							["<C-j>"] = "move_selection_next",
							["<C-k>"] = "move_selection_previous",
							["<C-t>"] = trouble.open_with_trouble,
						},
					},
				},
			})

			local extensions = { "dap", "noice", "fzf", "ui-select", "i23" }

			for _, ext in ipairs(extensions) do
				telescope.load_extension(ext)
			end
		end,
	},
}

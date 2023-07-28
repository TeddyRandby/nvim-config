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
      local entry_display = require("telescope.pickers.entry_display")
      local strings = require("plenary.strings")

      local trouble = require("trouble.providers.telescope")

      telescope.setup({
        picker = {
          hidden = false,
        },
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor({}),
            specific_opts = {
              ["codeaction"] = {
                make_indexed = function(items)
                  local indexed_items = {}
                  local widths = {
                    command_title = 0,
                    client_name = 0,
                  }
                  for idx, item in ipairs(items) do
                    local client = vim.lsp.get_client_by_id(item[1])
                    local entry = {
                      idx = idx,
                      ["add"] = {
                        command_title = item[2].title:gsub("\r\n", "\\r\\n"):gsub("\n", "\\n"),
                        client_name = client and client.name or "",
                      },
                      text = item,
                    }
                    table.insert(indexed_items, entry)

                    widths.command_title = math.max(
                      widths.command_title,
                      strings.strdisplaywidth(entry.add.command_title)
                    )

                    widths.client_name =
                        math.max(widths.client_name, strings.strdisplaywidth(entry.add.client_name))
                  end
                  return indexed_items, widths
                end,
                make_displayer = function(widths)
                  return entry_display.create({
                    separator = " ",
                    items = {
                      { width = widths.command_title },
                      { width = widths.client_name },
                    },
                  })
                end,
                make_display = function(displayer)
                  return function(e)
                    return displayer({
                      { e.value.add.command_title },
                      { e.value.add.client_name,  "TelescopeResultsComment" },
                    })
                  end
                end,
              },
            },
          },
        },
        defaults = {
          prompt_prefix = "     ",
          selection_caret = "  ",
          entry_prefix = "   ",
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "descending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "bottom",
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

      local extensions = { "dap", "noice", "fzf", "ui-select" }

      for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
      end
    end,
  },
}

local keymaps = require('utils').keymaps
return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-dap.nvim",        dependencies = { "mfussenegger/nvim-dap" } },
      { 'LukasPietzschmann/telescope-tabs' },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local telescope = require("telescope")
      local entry_display = require("telescope.pickers.entry_display")
      local strings = require("plenary.strings")
      local picker = require("utils").build_picker
      local qpicker = require("utils").build_qpicker

      local function send_to_trouble(prompt_bufnr)
        require("telescope.actions").send_to_qflist(prompt_bufnr)
        require("trouble").open("quickfix")
      end

      telescope.setup({
        pickers = {
          lsp_references = qpicker {},
          lsp_incoming_calls = qpicker {},
          lsp_outgoing_calls = qpicker {},
          lsp_definitions = qpicker {},
          lsp_type_definitions = qpicker {},
          lsp_implementations = qpicker {},
          diagnostics = qpicker {},
          buffers = qpicker {
            mappings = {
              n = {
                [require('utils').keymaps.DeleteNormal] = "delete_buffer",
              },
            },
          },

          live_grep = picker {},
          old_files = picker {},
          find_files = picker {},
          lsp_document_symbols = picker {},
          lsp_workspace_symbols = picker {},
          lsp_dynamic_workspace_symbols = picker {},

          git_branches = picker {
            mappings = {
              n = {
                [require('utils').keymaps.DeleteNormal] = "git_delete_branch",
              },
            },
          },
        },
        extensions = {
          ["telescope-tabs"] = qpicker {
            entry_formatter = function(tabid, buffer_ids, file_names, file_paths, is_current)
              local cwd = vim.fn.expand(
                vim.fn.haslocaldir(-1, tabid) and vim.fn.getcwd(-1, tabid) or ""
              )

              local entry_string = table.concat(vim.tbl_map(function(v)
                return vim.fn.fnamemodify(v, ":t")
              end, file_paths), ', ')

              return string.format('%s: %s', cwd, entry_string)
            end,
            close_tab_shortcut_n = require('utils').keymaps.DeleteNormal,
          },
          ["ui-select"] = {
            qpicker {},
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
                    })
                  end
                end,
              },
            },
          },
        },
        defaults = {
          prompt_prefix = require("utils").icons.Telescope .. ' ',
          selection_caret = require("utils").icons.Selection,
          entry_prefix = require('utils').icons.Entry,
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              prompt_position = "top",
              preview_width = 0,
              results_width = 1,
            },
            vertical = {
              mirror = true,
            },
            width = 70,
            height = 0.35,
            anchor = "N",
          },
          file_sorter = require("telescope.sorters").get_fuzzy_file,
          file_ignore_patterns = { "node_modules", ".git/", "dist/", "build/" },
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
              [keymaps.LeaveInsert] = "close",
              [keymaps.SelectNextInsert] = "move_selection_next",
              [keymaps.SelectPrevInsert] = "move_selection_previous",
              ["<C-t>"] = send_to_trouble,
            },
            n = {
              [keymaps.QuitNormal] = "close",
              [keymaps.SelectNext] = "move_selection_next",
              [keymaps.SelectPrev] = "move_selection_previous",
              ["t"] = send_to_trouble,
              ["<C-t>"] = send_to_trouble,
            },
          },
        },
      })

      local extensions = { "dap", "noice", "fzf", "ui-select", "telescope-tabs" }

      for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
      end
    end,
  },
}

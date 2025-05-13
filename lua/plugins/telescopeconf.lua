local keymaps = require('utils').keymaps
local borderStyle = require('utils').BorderStyle

local function format_icon(icon_name)
  return require('utils').icons[icon_name] .. " "
end

return {
  {
    "nvim-telescope/telescope.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      { "nvim-telescope/telescope-dap.nvim",        dependencies = { "mfussenegger/nvim-dap" } },
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
      { 'LukasPietzschmann/telescope-tabs' },
    },
    config = function()
      local layout = require("nui.layout")
      local popup = require("nui.popup")

      local telescope = require("telescope")

      local tslayout = require("telescope.pickers.layout")

      local function make_popup(options)
        local p = popup(options)

        return tslayout.Window(p)
      end

      local ipicker = require("utils").build_picker
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

          live_grep = ipicker {},
          old_files = ipicker {},
          find_files = ipicker {},
          lsp_document_symbols = ipicker {},
          lsp_workspace_symbols = ipicker {},
          lsp_dynamic_workspace_symbols = ipicker {},

          git_branches = ipicker {
            mappings = {
              n = {
                [require('utils').keymaps.DeleteNormal] = "git_delete_branch",
              },
            },
          },
        },
        extensions = {
          ["telescope-tabs"] = qpicker {
            close_tab_shortcut_n = require('utils').keymaps.DeleteNormal,
          },
          ["ui-select"] = qpicker {},
        },
        defaults = {
          create_layout = function(picker)
            local results = make_popup({
              border = {
                style = borderStyle,
                padding = { 0, 2 },
              },
            })

            local prompt = make_popup({
              enter = true,
              border = {
                style = borderStyle,
              },
              padding = { 0, 2 },
            })

            local box = layout.Box({
              layout.Box(prompt, { size = 3 }),
              layout.Box(results, { grow = 1 }),
            }, { dir = "col" })

            local lo = layout({
              relative = "editor",
              position = { row = 2, col = 0.5 },
              size = picker.layout_config.horizontal.size,
            }, box)

            lo.picker = picker
            lo.results = results
            lo.prompt = prompt

            return tslayout(lo)
          end,
          prompt_prefix = format_icon("Telescope"),
          selection_caret = require("utils").icons.Selection,
          entry_prefix = require('utils').icons.Entry,
          initial_mode = "insert",
          selection_strategy = "reset",
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          layout_config = {
            horizontal = {
              size = {
                height = 0.35,
                width = 0.6
              },
            },
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

      local extensions = { "dap", --[["noice",]] "fzf", "ui-select", "telescope-tabs" }

      for _, ext in ipairs(extensions) do
        telescope.load_extension(ext)
      end
    end,
  },
}

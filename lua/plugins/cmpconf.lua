local utils = require("utils")

return {
  {
    "hrsh7th/nvim-cmp",
    enabled = false,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "rcarriga/cmp-dap",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")

      local mapping = {
        [utils.keymaps.ScrollUp] = cmp.mapping.scroll_docs(-4),
        [utils.keymaps.ScrollDown] = cmp.mapping.scroll_docs(4),
        [utils.keymaps.Select] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          { "i", "s", "c" }
        ),
        [utils.keymaps.SelectNextInsert] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        [utils.keymaps.SelectPrevInsert] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      }

      cmp.setup({
        snippet = {
          -- REQUIRED - you must specify a snippet engine
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          end,
        },
        mapping = mapping,
        view = {
          entries = "custom",
          docs = {
            auto_open = true,
          },
        },
        window = {
          completion = {
            winhighlight = "FloatBorder:FloatBorder",
            border = require("utils").BorderStyle,
            col_offset = 0,
            side_padding = 0,
          },
          documentation = {
            winhighlight = "FloatBorder:FloatBorder",
            border = require("utils").BorderStyle,
            maxwidth = 10,
          },
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
          keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
          keyword_length = 1,
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(_, vim_item)
            vim_item.kind = (utils.icons[vim_item.kind] or '')
            vim_item.abbr = utils.strtruncate(vim_item.abbr, 30, "")
            vim_item.menu = utils.strtruncate(vim_item.menu, 20)
            return vim_item
          end,
        },
        sources = {
          { name = "codeium" },
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "nvim_lua" },
          { name = "path" },
        },
        preselect = cmp.PreselectMode.None,
      })

      cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
        mapping = mapping,
        sources = {
          { name = "dap" },
        },
      })

      cmp.setup.cmdline({ "/", "?" }, {
        mapping = mapping,
        sources = {
          { name = "buffer" },
        },
      })

      cmp.setup.cmdline(":", {
        mapping = mapping,
        completion = {
          completeopt = "menu,menuone,noinsert",
          keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
          keyword_length = 1,
        },
        sources = cmp.config.sources({
          { name = "path" },
          { name = "cmdline" },
        }),
      })
    end,
  },
}

return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "rcarriga/cmp-dap",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "saadparwaiz1/cmp_luasnip",
      "L3MON4D3/LuaSnip",
      "zbirenbaum/copilot-cmp",
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require("cmp")

      local keymaps = require("utils").keymaps

      require("copilot_cmp").setup()

      require("luasnip.loaders.from_vscode").lazy_load()

      local luasnip = require("luasnip")

      local lspkind = require("lspkind")

      local mapping = {
        [keymaps.ScrollUp] = cmp.mapping.scroll_docs(-4),
        [keymaps.ScrollDown] = cmp.mapping.scroll_docs(4),
        [keymaps.Select] = cmp.mapping(
          cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
          { "i", "s", "c" }
        ),
        [keymaps.SelectNext] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end, { "i", "s", "c" }),
        [keymaps.SelectPrev] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s", "c" }),
      }

      cmp.setup({
        mapping = mapping,
        confirmation = {
          get_commit_characters = function()
            return {}
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          }),
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
          keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
          keyword_length = 1,
        },
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = lspkind.cmp_format({
            mode = "symbol",
            maxwidth = 50,
            symbol_map = require('utils').icons,
          }),
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        sources = {
          { name = "nvim_lsp_signature_help" },
          { name = "nvim_lsp" },
          { name = "copilot" },
          { name = "nvim_lua" },
          { name = "luasnip" },
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

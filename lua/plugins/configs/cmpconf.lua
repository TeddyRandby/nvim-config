local cmp_ok, cmp = pcall(require, "cmp")

if not cmp_ok then
  return
end

local luasnip_ok, luasnip = pcall(require, "luasnip")

if not luasnip_ok then
  return
end

local lsp_kind_ok, lspkind = pcall(require, "lspkind")

if not lsp_kind_ok then
  return
end

require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup {
  experimental = {
    ghost_text = true,
  },
  confirmation = {
    get_commit_characters = function()
      return {}
    end,
  },
  window = {
    completion = {
      winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,Search:None",
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  },
  completion = {
    completeopt = "menu,menuone,noinsert",
    keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
    keyword_length = 1,
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      local kind = lspkind.cmp_format({ mode = "symbol_text", maxwidth = 50 })(entry, vim_item)
      local strings = vim.split(kind.kind, "%s", { trimempty = true })
      kind.kind = " " .. strings[1] .. " "
      kind.menu = "    (" .. strings[2] .. ")"

      return kind
    end,
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<Up>"] = cmp.mapping.scroll_docs(-4),
    ["<Down>"] = cmp.mapping.scroll_docs(4),
    ["<CR>"] = cmp.mapping(cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
    }, { "i", "s" }),
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "s", "c" }),
    ["<C-q>"] = cmp.mapping(cmp.mapping.close(), { "i", "s", "c" }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "path" },
    { name = "buffer" },
  },
  preselect = cmp.PreselectMode.None,
}

cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})

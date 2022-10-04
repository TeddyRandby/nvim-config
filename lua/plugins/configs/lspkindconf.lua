local ok, lsp_kind = pcall(require, "lspkind")

if not lsp_kind then
  return
end

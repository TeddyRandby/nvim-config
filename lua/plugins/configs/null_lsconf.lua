local null_ls_ok, null_ls = pcall(require, "null-ls")

if not null_ls_ok then
  return
end

null_ls.setup({
  on_init = function(new_client, _)
    new_client.offset_encoding = "utf-32"
  end,
  sources = {
    null_ls.builtins.formatting.stylua,

    null_ls.builtins.formatting.eslint,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.diagnostics.eslint,
    null_ls.builtins.formatting.fixjson,

    null_ls.builtins.formatting.prismaFmt,

    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.diagnostics.shellcheck,

    null_ls.builtins.formatting.clang_format,

    null_ls.builtins.diagnostics.fish,
  },
})

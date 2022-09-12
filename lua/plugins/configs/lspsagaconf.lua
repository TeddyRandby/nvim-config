local ok, saga = pcall(require, "lspsaga")

if not ok then
  return
end

saga.init_lsp_saga{
  move_in_saga = { prev = '<C-k>',next = '<C-j>'},
  rename_action_quit = "<leader>q"
}

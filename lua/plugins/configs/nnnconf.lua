local ok, nnn = pcall(require, "nnn")

if not ok then
  return
end

nnn.setup {
  explorer = {
    cmd = "nnn",
    side = "botright",
  },
  replace_netrw = "explorer"
}

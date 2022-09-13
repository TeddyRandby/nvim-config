local ok, comment = pcall(require, "Comment")

if not ok then
    return
end

comment.setup {
    padding = true,
    sticky = true,
    ignore = nil,
    toggler = {
        line = "gcc",
        block = "gbc",
    },
    mappings = {
        basic = true,
        extra = false,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
}

local ok, comment = pcall(require, "Comment")

if not ok then
    return
end

comment.setup {
    padding = true,
    sticky = true,
    ignore = nil,
    mappings = {
        basic = false,
        extra = false,
        extended = false,
    },
    pre_hook = nil,
    post_hook = nil,
}

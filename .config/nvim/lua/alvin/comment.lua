local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    print("unable to load comment")
    return
end

local ok, context_commentstring = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not ok then
    print("unable to load ts_context_commentstring")
    return
end

comment.setup({
    pre_hook = context_commentstring.create_pre_hook(),
})

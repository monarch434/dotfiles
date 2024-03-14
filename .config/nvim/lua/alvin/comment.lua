local status_ok, comment = pcall(require, "Comment")
if not status_ok then
    print("unable to load comment")
    return
end

local ok, context_commentstring = pcall(require, "ts_context_commentstring")
if not ok then
    print("unable to load ts_context_commentstring")
    return
end

context_commentstring.setup({
    enable_autocmd = false,
    languages = {
        typescript = "// %s",
    },
})

comment.setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
})

local status_ok, todo_comments = pcall(require, "todo-comments")
if not status_ok then
    print("unable to load todo-comments")
    return
end

todo_comments.setup()

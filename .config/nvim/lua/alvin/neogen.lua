local status_ok, neogen = pcall(require, "neogen")
if not status_ok then
    print("unable to load neogen")
    return
end

neogen.setup({ snippet_engine = "luasnip" })

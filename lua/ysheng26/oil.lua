local detail = false

require("oil").setup {
    delete_to_trash = true,
    watch_for_changes = true,
    view_options = {
        show_hidden = true,
    },
    keymaps = {
        ["gd"] = {
            desc = "Toggle file detail view",
            callback = function()
                detail = not detail
                if detail then
                    require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
                else
                    require("oil").set_columns({ "icon" })
                end
            end,
        },
    },
}

-- Need this for :Gbrowse to still work
vim.cmd [[command! -nargs=1 Browse silent execute '!open' shellescape(<q-args>,1)]]
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

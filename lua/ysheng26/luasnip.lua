-- require("luasnip.loaders.from_vscode").lazy_load({ paths = { "./snippets" } })
require("luasnip.loaders.from_vscode").lazy_load()

local ls = require("luasnip")

vim.keymap.set({ "i" }, "<c-k>", function() ls.expand() end, { silent = true })
vim.keymap.set({ "i", "s" }, "<tab>", function() ls.jump(1) end, { silent = true })
vim.keymap.set({ "i", "s" }, "<s-tab>", function() ls.jump(-1) end, { silent = true })

vim.keymap.set({ "i", "s" }, "<c-e>", function()
    if ls.choice_active() then
        ls.change_choice(1)
    end
end, { silent = true })

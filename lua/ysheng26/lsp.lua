-- mason and lspconfig setup
require("mason").setup()

local cmp_lsp = require("cmp_nvim_lsp")
local capabilities = vim.tbl_deep_extend(
    "force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
        "rust_analyzer",
        "gopls",
    },
    handlers = {
        function(server_name) -- default handler (optional)
            require("lspconfig")[server_name].setup({
                capabilities = capabilities,
            })
        end,

        ["lua_ls"] = function()
            local lspconfig = require("lspconfig")
            lspconfig.lua_ls.setup({
                capabilities = capabilities,
                settings = {
                    Lua = {
                        runtime = { version = "Lua 5.1" },
                        diagnostics = {
                            globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                        },
                    },
                },
            })
        end,
    },
})

-- autocomplete
local cmp = require("cmp")
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    snippet = {
        expand = function(args)
            vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
    },
    window = {
        -- completion = cmp.config.window.bordered(),
        -- documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ["<c-p>"] = cmp.mapping.select_prev_item(cmp_select),
        ["<c-n>"] = cmp.mapping.select_next_item(cmp_select),
        ["<enter>"] = cmp.mapping.confirm({ select = true }),
        ["<tab>"] = cmp.mapping.confirm({ select = true }),
        ["<c-space>"] = cmp.mapping.complete(),
        ["<c-u>"] = cmp.mapping.scroll_docs(-5),
        ["<c-d>"] = cmp.mapping.scroll_docs(5),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
    }, {
        { name = "buffer" },
    }),
})


-- keymaps
local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local ysheng26Group = augroup('ysheng26', {})
autocmd('LspAttach', {
    group = ysheng26Group,
    callback = function(e)
        local opts = { buffer = e.buf }
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "gD", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "<leader>g", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "<leader>G", function() vim.lsp.buf.declaration() end, opts)
        vim.keymap.set("n", "<leader>s", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>t", function() vim.lsp.buf.type_definition() end, opts)
        vim.keymap.set("n", "<leader>i", function() vim.lsp.buf.implementation() end, opts)
        vim.keymap.set("n", "gs", function() vim.lsp.buf.document_symbol() end, opts)
        vim.keymap.set("n", "gS", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>d", function() vim.diagnostic.setloclist() end, opts)
        vim.keymap.set("n", "<leader>D", function() vim.diagnostic.setqflist() end, opts)
        vim.keymap.set("n", "cd", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("n", "g.", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("i", "<c-h>", function() vim.lsp.buf.signature_help() end, opts)
    end
})

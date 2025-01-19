return {
    {
        "williamboman/mason.nvim",
        lazy = false,
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "lua_ls",
                    "jdtls",
                    "pyright",
                    "lemminx",
                }, -- Ensure these LSPs are installed in Mason
            })
        end,
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            local capabilities = require("cmp_nvim_lsp").default_capabilites
            local lspconfig = require("lspconfig")
            -- setup each lsp
            lspconfig.lua_ls.setup({ capabilites = capabilities })
            lspconfig.jdtls.setup({ capabilites = capabilities })
            lspconfig.pyright.setup({ capabilites = capabilities })
            lspconfig.lemminx.setup({ capabilites = capabilities })

            -- setup keybinds
            vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})

            -- styling
            vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })

            vim.lsp.handlers["textDocument/signatureHelp"] =
                vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })
        end,
    },
}

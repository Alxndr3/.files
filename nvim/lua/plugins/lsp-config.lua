return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗"
                    }
                }
            })
        end,
    },

    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = {
            "williamboman/mason.nvim"
        },

        config = function()
            require("mason-lspconfig").setup({
                ensure_istalled = {
                    "bashls",
                    "lua_ls",
                    "pyright",
                    "yamlls",
                    "clangd"
                }
            })
            require("mason-lspconfig").setup_handlers(
            {
                function(server_name) -- default handler (optional)
                    require("lspconfig")[server_name].setup({})
                end,
            })
        end,
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            lspconfig.bashls.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.basedpyright.setup({})
            lspconfig.clangd.setup({})
        end,
    }
}

return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require"nvim-treesitter.configs".setup {
            -- ensure_installed = { "bash", "c", "lua", "vim", "vimdoc", "query", "python", "yaml" },
            auto_install = true,
            highlight = {
                enable = true,
            },
        }
    end,
}

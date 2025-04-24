return {
    "nvim-treesitter/nvim-treesitter",
    config = function()
        require"nvim-treesitter.configs".setup {
            ensure_installed = { "bash", "c", "css", "gitignore", "html", "javascript", "lua", "markdown", "vim", "vimdoc", "query", "python", "regex", "yaml" },
            auto_install = true,
            highlight = {
                enable = true,
            },
        }
    end,
}

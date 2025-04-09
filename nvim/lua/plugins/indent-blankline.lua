return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    config = function()
        require("ibl").setup({
            scope = { enabled = false },
            indent = {
                char = "│",
                tab_char = "│",
            },
        })
    end
}

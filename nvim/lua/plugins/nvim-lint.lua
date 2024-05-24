return {
    "mfussenneger/nvim-lint",
    event = {
        "BufReadPre",
        "BufNewFile",
    },
    config = function()
        local lint = require("lint");

        lint.linters_by_ft = {
            python = {"flake8"},
            shell = {"shellcheck"},
            yaml = {"yamllint"},
            lua = {"luacheck"}
        }

        local lint_augroup = vim.api.nvim_create_augroup("lint", {clear=true})
        vim.api.nvim_create_autocmd({"BufEnter", "BufWritePost", "InsertLeave"}, {
            group = lint_augroup,
            callback = function()
                lint.try_lint()
            end,
        })

        -- lint work in virtualenv
        require('lint').linters.pylint.cmd = 'python'
        require('lint').linters.pylint.args = {'-m', 'pylint', '-f', 'json'}

        vim.keymap.set("n", "<leader>j", function()
            lint.try_lint()
        end, {desc = "Trigger lint"})
    end,
}

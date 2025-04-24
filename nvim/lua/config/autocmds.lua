-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

-- Run
vim.cmd [[
    augroup run_file
       autocmd BufEnter *.py let @r=":w\<CR>:10sp | terminal python %\<CR>i"
       autocmd BufEnter *.sh let @r=":w\<CR>:10sp | terminal bash %\<CR>i"
]]

-- Folding
-- vim.cmd [[
--     augroup folding
--         autocmd BufWinLeave ?* silent! mkview
--         autocmd BufWinEnter ?* silent! loadview
-- ]]

vim.api.nvim_create_autocmd({"BufWinLeave", "BufLeave", "BufWritePost", "BufHidden"}, {
    pattern = {"*.*"},
    callback = function()
        -- Only save view for normal files with content
        if vim.fn.expand("%") ~= "" and vim.bo.filetype ~= "gitcommit" then
            vim.cmd("mkview")
        end
    end,
})

vim.api.nvim_create_autocmd({"BufWinEnter"}, {
    pattern = {"*.*"},
    callback = function()
        -- Only load view for normal files
        if vim.fn.expand("%") ~= "" and vim.bo.filetype ~= "gitcommit" then
            vim.cmd("silent! loadview")
        end
    end,
})

-- Indent by filetype
vim.api.nvim_create_autocmd("FileType", {
  pattern = {"c", "cpp", "js", "py"},
  callback = function()
    vim.bo.tabstop = 4
    vim.bo.softtabstop = 4
    vim.bo.shiftwidt = 4
    vim.bo.expandtab = true
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = {"lua", "yaml", "yml", "html", "css"},
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.softtabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = {"*.yaml", "*.yml", "*.html", "*.css"},
  callback = function()
    vim.bo.tabstop = 2
    vim.bo.softtabstop = 2
    vim.bo.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

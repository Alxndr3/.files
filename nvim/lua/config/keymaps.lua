-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set
local opts = {noremap = true, silent = true}

-- Neotree
keymap({"n", "i"}, "<Leader>n", "<cmd> Neotree toggle <CR>", opts)

-- Save file
keymap({"n", "i"}, "<C-s>", "<cmd> update <CR>", opts)

-- Split motion
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- lualine -- Jump to buffers
for b=0, 9 do
    keymap("n", string.format("<Leader>%d", b),string.format(":LualineBuffersJump %d<CR>", b), opts)
end

-- close buffer
local function check_buf()
  local output = vim.api.nvim_exec("buffers", true) -- true means return output as string
  local number_lines = vim.tbl_count(vim.split(output, "\n"))
  if number_lines > 1 then
    vim.cmd("bp | bd #")
  else
    vim.cmd("enew | bd #")
    vim.cmd("wincmd h")
  end
end

-- keymap("n", "<C-x>", "<ESC>:bd<CR>", opts)
-- keymap("n", "<Leader>x", "<cmd> bp | bd #<CR>", opts)

keymap("n", "<Leader>x", check_buf, opts)
keymap("n", "<Leader>p", "<cmd> bn <CR>", opts)
keymap("n", "<C-p>p", "<cmd> bp <CR>", opts)

-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Toggleterm clear terminal
-- keymap({"n", "i"}, "<C-l>", "<C-M-l>", opts)
keymap({"n", "i"}, "<C-l>", "<C-M>l", opts)

-- Formatter
keymap("n", "<leader>fm", ":silent !black %<cr>", opts)

-- lsp diagnostics
keymap('n', '<space>e', vim.diagnostic.open_float)
keymap('n', '[d', vim.diagnostic.goto_prev)
keymap('n', ']d', vim.diagnostic.goto_next)
keymap('n', '<space>q', vim.diagnostic.setloclist)




-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap.set

-- Neotree
keymap({"n", "i"}, "<Leader>n", "<ESC>:Neotree toggle<CR>", opts)

-- Save file
keymap({"n", "i"}, "<C-s>", "<ESC>:update<CR>", opts)

-- Split motion
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- lualine
-- Jump to buffers
for b=0, 9 do
    keymap("n", string.format("<Leader>%d", b),string.format(":LualineBuffersJump %d<CR>", b), opts)
end

-- close buffer
keymap("n", "<C-x>", "<ESC>:bp | bd #<CR>", opts)
-- keymap("n", "<C-x>", "<ESC>:bd<CR>", opts)
keymap("n", "<C-c>p", "<ESC>:bn<CR>", opts)
keymap("n", "<C-p>", "<ESC>:bp<CR>", opts)

-- Stay in indent mode
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)

-- Toggleterm clear terminal
keymap("i", "<C-l>", "<C><A>l", opts)

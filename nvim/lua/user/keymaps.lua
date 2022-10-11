-- no recursive map
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = ' '

keymap("", "<leader>w", ":w<CR>", opts)
keymap("", "<leader>q", ":q<CR>", opts)

-- Window navigation
keymap("", "<C-l>", "<C-w>l", opts)
keymap("", "<C-h>", "<C-w>h", opts)
keymap("", "<C-j>", "<C-w>j", opts)
keymap("", "<C-k>", "<C-w>k", opts)

-- Enter normal mode by pressing jk
keymap("i", "jk", "<ESC>", opts)

-- vimrc
keymap("n", "<leader>ev", ":vsplit $MYVIMRC<cr>", opts)
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts)

-- keep search results in the center of screen
keymap("n", "n", "nzz", opts)
keymap("n", "N", "Nzz", opts)
keymap("n", "*", "*zz", opts)

-- cancel highlight
keymap("n", "<leader>l", ":nohl<CR>", opts)

-- preserve highlight after indent
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- NvimTree
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- By default, Ctrl-i has the same unicode as ESC, so pressing Ctrl-i will send an escape sequence to the nvim process.
-- In my alacritty perferences, I map <C-i> to !, since ! does nothing
-- useful in normal mode
-- This means that pressing <C-i> actually sends ! to the neovim process
-- So, I remap ! back to <c-i> here
keymap("", "!", "<C-i>", opts)

-- Telescope
keymap("n", "<leader>f", "<CMD>Telescope find_files<CR>", opts)
keymap("n", "<leader>g", "<CMD>Telescope live_grep<CR>", opts)

-- Gitsigns
keymap("n", "gb", "<CMD>Gitsigns blame_line<CR>", opts)

-- quickfix list
keymap("n", "<leader>cl", "<CMD>ccl<CR>", opts);

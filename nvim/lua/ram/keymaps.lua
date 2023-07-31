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

-- Telescope
keymap("n", "<leader>f", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>", opts)

local grep_glob_pattern = '!context/packages/session-replay-player/*'
local lua_command = string.format("<CMD>lua require('telescope.builtin').live_grep({ glob_pattern = '%s'})<CR>", grep_glob_pattern)
keymap("n", "<leader>g", lua_command, opts)

-- quickfix list
keymap("n", "<leader>cl", "<CMD>ccl<CR>", opts);

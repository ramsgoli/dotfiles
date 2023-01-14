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
keymap("n", "<leader>f", "<CMD>lua require('telescope.builtin').find_files({hidden = true})<CR>", opts)
keymap("n", "<leader>g", "<CMD>Telescope live_grep<CR>", opts)

-- quickfix list
keymap("n", "<leader>cl", "<CMD>ccl<CR>", opts);

-- dap
keymap('n', '<leader>dct', '<cmd>lua require"dap".continue()<CR>', opts)
keymap('n', '<leader>dsv', '<cmd>lua require"dap".step_over()<CR>', opts)
keymap('n', '<leader>dsi', '<cmd>lua require"dap".step_into()<CR>', opts)
keymap('n', '<leader>dso', '<cmd>lua require"dap".step_out()<CR>', opts)
keymap('n', '<leader>dtb', '<cmd>lua require"dap".toggle_breakpoint()<CR>', opts)

keymap('n', '<leader>dsc', '<cmd>lua require"dap.ui.variables".scopes()<CR>', opts)
keymap('n', '<leader>dhh', '<cmd>lua require"dap.ui.variables".hover()<CR>', opts)
keymap('v', '<leader>dhv', '<cmd>lua require"dap.ui.variables".visual_hover()<CR>', opts)

keymap('n', '<leader>duh', '<cmd>lua require"dap.ui.widgets".hover()<CR>', opts)
keymap('n', '<leader>duf', "<cmd>lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>",
  opts)

keymap('n', '<leader>dsbr', '<cmd>lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>', opts)
keymap('n', '<leader>dsbm', '<cmd>lua require"dap".set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<CR>',
  opts)
keymap('n', '<leader>dro', '<cmd>lua require"dap".repl.open()<CR>', opts)
keymap('n', '<leader>drl', '<cmd>lua require"dap".repl.run_last()<CR>', opts)


-- telescope-dap
keymap('n', '<leader>dcc', '<cmd>lua require"telescope".extensions.dap.commands{}<CR>', opts)
keymap('n', '<leader>dco', '<cmd>lua require"telescope".extensions.dap.configurations{}<CR>', opts)
keymap('n', '<leader>dlb', '<cmd>lua require"telescope".extensions.dap.list_breakpoints{}<CR>', opts)
keymap('n', '<leader>dv', '<cmd>lua require"telescope".extensions.dap.variables{}<CR>', opts)
keymap('n', '<leader>df', '<cmd>lua require"telescope".extensions.dap.frames{}<CR>', opts)

-- nvim-dap-ui
keymap('n', '<leader>dui', '<cmd>lua require"dapui".toggle()<CR>', opts)

-- General config
vim.opt.hidden = true -- hide buffers when navigating to different files
vim.opt.backup = false -- don't create backup files
vim.opt.autoread = true -- Re-read file if it changes outside of vim
vim.opt.updatetime = 50
vim.opt.shell = '/bin/zsh'
vim.opt.completeopt = { 'menuone', 'noselect' }

-- Indentation
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.signcolumn = 'yes'

-- colors
vim.opt.termguicolors = true
vim.opt.background = 'dark'

-- commands provided by lsp
vim.cmd [[ command! Rename execute 'lua vim.lsp.buf.rename()' ]]
vim.cmd [[ command! BufOnly silent execute "%bd | e# | bd#" ]]

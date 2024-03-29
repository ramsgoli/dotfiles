-- General config
vim.opt.hidden = true   -- hide buffers when navigating to different files
vim.opt.backup = false  -- don't create backup files
vim.opt.autoread = true -- Re-read file if it changes outside of vim
vim.opt.updatetime = 50
vim.opt.shell = '/bin/zsh'
vim.opt.completeopt = { 'menuone', 'noselect' }
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.wrap = false
vim.opt.splitright = true

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

-- folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

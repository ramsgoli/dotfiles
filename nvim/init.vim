" Lua {{{
lua require('ram.config')
lua require('ram.keymaps')
lua require('ram.plugins')
lua require('ram.treesitter')
lua require('ram.telescope')
lua require('ram.cmp')
lua require('ram.lsp')
lua require('ram.colors')
lua require('ram.nvimtree')
lua require('ram.lsp_signature')
lua require('ram.lualine')
lua require('ram.git')
lua require('ram.indent_blankline')
lua require('ram.autopairs')
lua require('ram.commands')
lua require('ram.fidget')
"}}}

" General Config {{{
command! Refresh execute 'bufdo :e' | syntax enable
" }}}

" Search Options {{{
set ignorecase " ignore case when searching
set smartcase " unless the search query contains a capital letter
set wildignore+=*/node_modules/*
set wildignore+=context/session_replay/*
" }}}

" User Interface {{{
set splitright
set number relativenumber
set nowrap
" }}}

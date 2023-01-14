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
lua require('ram.jest')

"}}}

" General Config {{{
command! Refresh execute 'bufdo :e' | syntax enable
" }}}

" Search Options {{{
set ignorecase " ignore case when searching
set smartcase " unless the search query contains a capital letter
set wildignore+=*/node_modules/*
" }}}

" User Interface {{{
set splitright
set number relativenumber
set nowrap
" }}}

" Key Mappings {{{
nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-c> :bp\|bd #<CR>

" delete all buffers except the current one
noremap <leader>da :%bd\|e#\|bd#<cr>\|'"


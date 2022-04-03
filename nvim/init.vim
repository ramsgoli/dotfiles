" Lua {{{
lua require('user.config')
lua require('user.keymaps')
lua require('user.plugins')
lua require('user.treesitter')
lua require('user.telescope')
lua require('user.cmp')
lua require('user.lsp')
lua require('user.colors')
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


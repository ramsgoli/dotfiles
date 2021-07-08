" Plugins {{{
call plug#begin('~/.local/share/nvim/plugged')
call plug#end()
" }}}

" General Config {{{
let g:mapleader=' '
set hidden " hide buffers when navigating to different files
set nobackup " Some servers have issues with backup files, see #649
set autoread " Re-read file if it changes outside of vim
set nowritebackup
set updatetime=50
set shell=/bin/zsh
command! Refresh execute 'bufdo :e' | syntax enable
" }}}

" Default Indentation Options {{{
set autoindent
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
" }}}

" Search Options {{{
set ignorecase " ignore case when searching
set smartcase " unless the search query contains a capital letter
nnoremap <leader>l :nohl<CR>
set wildignore+=*/node_modules/*

" Keep search results in center of screen
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
" }}}

" User Interface {{{
set splitright
set number relativenumber
set nowrap
" }}}

" Key Mappings {{{
noremap <leader>w :w<CR>
noremap <leader>q :q<CR>

noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

noremap <leader>ev :vsplit $MYVIMRC<cr>
noremap <leader>sv :source ~/.config/nvim/init.vim<CR>

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-c> :bp\|bd #<CR>

" delete all buffers except the current one
noremap <leader>da :%bd\|e#\|bd#<cr>\|'"

" By default, Ctrl-i has the same unicode as ESC, so pressing
" In my alacritty perferences, I map <C-i> to !, since ! does nothing
" useful in normal mode
" This means that pressing <C-i> actually sends ! to the neovim process
" So, I remap ! back to <c-i> here
noremap ! <C-i>
" }}}


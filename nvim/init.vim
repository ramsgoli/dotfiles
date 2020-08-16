" Plugins {{{
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'morhetz/gruvbox'
	Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
	Plug 'vimlab/split-term.vim'
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/fzf.vim'
	Plug 'jiangmiao/auto-pairs'
	Plug 'digitaltoad/vim-pug'
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	Plug 'sgur/vim-editorconfig'
	Plug 'tpope/vim-fugitive'
	Plug 'mhinz/vim-startify'
	Plug 'justinmk/vim-sneak'
  Plug 'tpope/vim-surround'
  Plug 'mhinz/vim-signify'

	" These next two are both for ranger
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'

	Plug 'sheerun/vim-polyglot'  " Language pack
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

" Allows options to be passed into :Rg command
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always '
	\  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
	\   <bang>0)
" }}}

" Plugin Config {{{
source $HOME/.config/nvim/plugin-config/ranger.vim
source $HOME/.config/nvim/plugin-config/startify.vim
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
colorscheme gruvbox
set shortmess+=c
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_section_y = ''
let g:airline_theme='gruvbox'
set noshowmode  " to get rid of vanilla vim modes

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
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

nnoremap <leader>f :GFiles --cached --others --exclude-standard<CR>

nnoremap <silent> <Tab> :bn<CR>
nnoremap <silent> <S-Tab> :bp<CR>
nnoremap <silent> <C-c> :bp\|bd #<CR>

" delete all buffers except the current one
noremap <leader>da :%bd\|e#\|bd#<cr>\|'"

nnoremap <leader>gb :Gblame<CR>

" By default, Ctrl-i has the same unicode as ESC, so pressing
" In my alacritty perferences, I map <C-i> to !, since ! does nothing
" useful in normal mode
" This means that pressing <C-i> actually sends ! to the neovim process
" So, I remap ! back to <c-i> here
noremap ! <C-i>
" }}}

" FZF Floating Window {{{
function! FloatingFZF()
  let buf = nvim_create_buf(v:false, v:true)

  " here be dragoons
  let width = float2nr(&columns * 0.9)
	let height = float2nr(&lines * 0.6)
  let horizontal = float2nr((&columns - width) / 2)
  let vertical = 1
  let opts = {
        \ 'relative': 'editor',
        \ 'row': vertical,
        \ 'col': horizontal,
        \ 'width': width,
        \ 'height': height / 2,
        \ 'style': 'minimal'
        \ }

  let win = nvim_open_win(buf, v:true, opts)
  call setwinvar(win, '&winhl', 'NormalFloat:TabLine')

  " this is to remove all line numbers and so on from the window
  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction

let g:fzf_layout = { 'window': 'call FloatingFZF()' }
" }}}

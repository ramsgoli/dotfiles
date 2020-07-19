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

	" These next two are both for ranger
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'

	Plug 'sheerun/vim-polyglot'  " Language pack
	call plug#end()
" }}}

let g:mapleader=' '

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
" }}}

" User Interface {{{
set splitright
set number relativenumber
set nowrap
colorscheme gruvbox
set shortmess+=F  " to get rid of the file name displayed in the command line bar
set shortmess+=c " don't give |ins-completion-menu| messages.
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#branch#enabled = 0
let g:airline_section_y = ''
let g:airline_theme='gruvbox'
set noshowmode  " to get rid of vanilla vim modes

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
	" Recently vim can merge signcolumn and number column into one
	set signcolumn=number
else
	set signcolumn=yes
endif
" }}}

" General Config {{{
set hidden " hide buffers when navigating to different files
set nobackup " Some servers have issues with backup files, see #649
set autoread " Re-read file if it changes outside of vim
set nowritebackup
set updatetime=50
set shell=/bin/zsh
command! Refresh execute 'bufdo :e' | syntax enable
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

" By default, Ctrl-i has the same unicode as ESC, so pressing
" In my alacritty perferences, I map <C-i> to !, since ! does nothing
" useful in normal mode
" This means that pressing <C-i> actually sends ! to the neovim process
" So, I remap ! back to <c-i> here
noremap ! <C-i>
" }}}

" Allows options to be passed into :Rg command
command! -bang -nargs=* Rg
	\ call fzf#vim#grep(
	\   'rg --column --line-number --no-heading --color=always '
	\  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
	\   <bang>0 ? fzf#vim#with_preview('up:60%')
	\           : fzf#vim#with_preview('right:50%:hidden', '?'),
	\   <bang>0)

let g:ranger_map_keys = 0
let g:startify_change_to_vcs_root = 1

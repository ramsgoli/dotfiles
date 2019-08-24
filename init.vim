" Plugins
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'sheerun/vim-polyglot'  " Language pack
	Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
	Plug 'vimlab/split-term.vim'
	Plug 'wincent/command-t'
	call plug#end()

" NerdTree
	let NERDTreeShowHidden=1

	" open NerdTree with <C-n>
	nnoremap <C-n> :NERDTreeToggle<CR>

	" Enter NerdTree automatically
	augroup nerd_tree
		autocmd! 
		autocmd VimEnter * NERDTree
		autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	augroup END

	" Automaticaly close nvim if NERDTree is only thing left open

" General Editor Config
	" Remap leader key to ;
	let g:mapleader=';'

	syntax on
	set splitright
	set nu
	set shell=/bin/zsh
	set nowrap

	noremap <leader>w :w<CR>
	noremap <leader>q :q<CR>

	" Make window navigation easier
	noremap <C-l> <C-w>l
	noremap <C-h> <C-w>h
	noremap <C-j> <C-w>j
	noremap <C-k> <C-w>k

	" Re-read file if it changes outside of vim
	set autoread

	" Don't search inside node_modules
	set wildignore+=*/node_modules/*

	" hit space to visually select a word
	nnoremap <space> viw

	" hit - to move the current line down by one
	nnoremap - ddp

	" edit init.vim in a vertical split
	noremap <leader>ev :vsplit $MYVIMRC<cr>

	" source vimrc with sv
	noremap <leader>sv :source ~/.config/nvim/init.vim<CR>

	" surround word in quotes (normal mode only)
	nnoremap " i"<esc>ea"<esc>

" Theme
	set termguicolors
	colorscheme onedark

" Command-t
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']

" Filetype
	augroup filetype_html
		autocmd!
		autocmd FileType html setlocal ts=2 sts=2 sw=2
	augroup END

	augroup filetype_css
		autocmd!
		autocmd FileType css setlocal ts=2 sts=2 sw=2
	augroup END

	augroup filetype_javascript
		autocmd!
		autocmd FileType javascript setlocal ts=2 sts=2 sw=2 smarttab expandtab
	augroup END

	augroup filetype_java
		autocmd!
		autocmd FileType java setlocal ts=4 sts=4 sw=4 smarttab expandtab
	augroup END

" COC
	nmap <silent> gd <Plug>(coc-definition)
	set updatetime=300

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>
	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
		else
			call CocAction('doHover')
		endif
	endfunction

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

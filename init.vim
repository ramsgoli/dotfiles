" Plugins
	call plug#begin('~/.local/share/nvim/plugged')
	Plug 'joshdick/onedark.vim'
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'sheerun/vim-polyglot'  " Language pack
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

	" Golang
	Plug 'fatih/vim-go'
	call plug#end()

" FZF
	" Allows options to be passed into :Rg command
	command! -bang -nargs=* Rg
	  \ call fzf#vim#grep(
	  \   'rg --column --line-number --no-heading --color=always '
	  \  . (len(<q-args>) > 0 ? <q-args> : '""'), 1,
	  \   <bang>0 ? fzf#vim#with_preview('up:60%')
	  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
	  \   <bang>0)

" NerdTree
	let NERDTreeShowHidden=1

	" open NerdTree with <C-n>
	nnoremap <C-n> :NERDTreeToggle<CR>

	" Enter NerdTree automatically
	augroup nerd_tree
		autocmd VimEnter * NERDTree
		autocmd VimEnter * wincmd p
		" Automaticaly close nvim if NERDTree is only thing left open
		" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
	augroup END


" General Editor Config

	" In my ITerm perferences, I map <C-i> to <a-i> (esc i)
	" This means that pressing <C-i> actually sends <a-i> to the neovim
	" process
	" So, I remap <a-i> back to <c-i> here
	noremap <a-i> <C-i>

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

	" Open :GFiles (fzf) with ;f
	nnoremap <leader>f :GFiles --cached --others --exclude-standard<CR>

	" Disable highlight with ;<space>
	nnoremap <leader><space> :nohl<CR>

	" Navigate buffers with <TAB> and <SHIFT TAB>
	nnoremap <silent> <Tab> :bn<CR>
	nnoremap <silent> <S-Tab> :bp<CR>
	nnoremap <silent> <C-c> :bp\|bd #<CR>

	" Show current file in NerdTree Menu
	nnoremap <silent> <leader>sf :NERDTreeFind<CR>

" Theme
	set termguicolors
	colorscheme onedark

" Command-t
	let g:CommandTCancelMap = ['<ESC>', '<C-c>']

" Filetype

	augroup filetype_vim
		autocmd FileType vim setlocal foldmethod=marker
	augroup END

	augroup filetype_html
		autocmd FileType html setlocal ts=2 sts=2 sw=2
	augroup END

	augroup filetype_css
		autocmd BufRead,BufNewFile *.css,*.scss setlocal ts=2 sts=2 sw=2
	augroup END

	augroup filetype_javascript
		autocmd FileType javascript setlocal ts=2 sts=2 sw=2 smarttab expandtab
	augroup END

	augroup filetype_typescript
		autocmd FileType typescript setlocal ts=2 sts=2 sw=2 smarttab expandtab
	augroup END

	augroup filetype_tsx
		autocmd BufRead,BufNewFile *.tsx setlocal ts=2 sts=2 sw=2 smarttab expandtab
	augroup END

	augroup filetype_java
		autocmd FileType java setlocal ts=4 sts=4 sw=4 smarttab expandtab
	augroup END

	augroup filetype_pug
		autocmd BufRead,BufNewFile *.pug setlocal ts=2 sts=2 sw=2 smarttab expandtab
	augroup END

" Airline
	let g:airline#extensions#tabline#enabled = 1
	let g:airline#extensions#branch#enabled = 0
	set noshowmode  " to get rid of thing like --INSERT--
	set noshowcmd  " to get rid of display of last command
	set shortmess+=F  " to get rid of the file name displayed in the command line bar

" CO
	" Flow support
	let g:javascript_plugin_flow = 1
	" disable vim-go :GoDef short cut (gd)
	" this is handled by LanguageClient [LC]
	let g:go_def_mapping_enabled = 0

	" if hidden is not set, TextEdit might fail.
	set hidden

	" Some servers have issues with backup files, see #649
	set nobackup
	set nowritebackup

	" You will have bad experience for diagnostic messages when it's default 4000.
	set updatetime=300

	" don't give |ins-completion-menu| messages.
	set shortmess+=c

	" always show signcolumns
	set signcolumn=yes

	" Use tab for trigger completion with characters ahead and navigate.
	" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
	inoremap <silent><expr> <TAB>
		  \ pumvisible() ? "\<C-n>" :
		  \ <SID>check_back_space() ? "\<TAB>" :
		  \ coc#refresh()
	inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

	function! s:check_back_space() abort
	  let col = col('.') - 1
	  return !col || getline('.')[col - 1]  =~# '\s'
	endfunction

	" Use <c-space> to trigger completion.
	inoremap <silent><expr> <c-space> coc#refresh()

	" Remap keys for gotos
	nmap <silent> gd <Plug>(coc-definition)
	nmap <silent> gy <Plug>(coc-type-definition)
	nmap <silent> gi <Plug>(coc-implementation)
	nmap <silent> gr <Plug>(coc-references)

	" Use K to show documentation in preview window
	nnoremap <silent> K :call <SID>show_documentation()<CR>

	function! s:show_documentation()
		if (index(['vim','help'], &filetype) >= 0)
			execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
	endfunction

	" Remap for rename current word
	nmap <leader>rn <Plug>(coc-rename)

	augroup mygroup
	  " Setup formatexpr specified filetype(s).
	  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	  " Update signature help on jump placeholder
	  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
	augroup end

	" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
	xmap <leader>a  <Plug>(coc-codeaction-selected)
	nmap <leader>a  <Plug>(coc-codeaction-selected)

	" Remap for do codeAction of current line
	nmap <leader>ac  <Plug>(coc-codeaction)

	" Create mappings for function text object, requires document symbols feature of languageserver.
	xmap if <Plug>(coc-funcobj-i)
	xmap af <Plug>(coc-funcobj-a)
	omap if <Plug>(coc-funcobj-i)
	omap af <Plug>(coc-funcobj-a)

	" Using CocList
	" Show all diagnostics
	nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
	" Manage extensions
	nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
	" Show commands
	nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
	" Find symbol of current document
	nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
	" Search workspace symbols
	nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
	" Do default action for next item.
	nnoremap <silent> <space>j  :<C-u>CocNext<CR>
	" Do default action for previous item.
	nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
	" Resume latest coc list
	nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

	function! SplitIfNotOpen(call, fname)
	    let bufnum=bufnr(expand(a:fname))
	    let winnum=bufwinnr(bufnum)
	    if winnum != -1
		" Jump to existing split
		exe winnum . "wincmd w"
	    else
		" Make new split as usual
		exe "vsplit " . a:fname
	    endif
	    " Execute the cursor movement command
	    exe a:call
	endfunction

	command! -nargs=+ CocSplitIfNotOpen :call SplitIfNotOpen(<f-args>)

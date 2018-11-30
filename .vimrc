" Plugins
    call plug#begin('~/.vim/plugged')
    Plug 'tomasiser/vim-code-dark'
    Plug 'pangloss/vim-javascript'
    Plug 'jremmen/vim-ripgrep'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'yssl/QFEnter'
    Plug 'wincent/command-t'
    Plug 'scrooloose/nerdtree'
    Plug 'valloric/YouCompleteMe'
    Plug 'jiangmiao/auto-pairs'
    Plug 'itchyny/lightline.vim'
    call plug#end()

" YCM
    let g:ycm_autoclose_preview_window_after_insertion = 1

" Editor niceties
    set splitright
    set backspace=2  " Make backspace work normally
    set nocursorline
    filetype plugin indent on
    set nowrap
    set nu
    syntax enable
    set ruler  " column number
    set ignorecase  " ignore case when searching
    set conceallevel=0

" Colors + Syntax highlighting
    set t_Co=256
    set t_ut=
    colorscheme codedark
    let g:vim_jsx_pretty_colorful_config = 1
    let g:vim_jsx_pretty_enable_jsx_highlight = 1

" Nerdtree
    let NERDTreeIgnore = ['\.o$', '\.out$', '\.swp$', '.git', '.DS_Store' ]
    let NERDTreeShowHidden=1

    " open nerdtree with Ctrl-n
    map <C-n> :NERDTreeToggle<CR>

" Key mappings
    let mapleader = ";"

    noremap <Leader>w :w<CR>
    noremap <Leader>q :q<CR>

    " Make it easier to navigate between panes
    nnoremap <C-l> <C-w>l
    nnoremap <C-h> <C-w>h
    nnoremap <C-j> <C-w>j
    nnoremap <C-k> <C-w>k

    " Map fugitive git commands to more friendlier ones
    nnoremap :gs<CR> :Gstatus<CR>

    " Map Shift f to *, which find all occurences of word under cursor
    nnoremap <S-f> *

    " Open .vimrc in vertical split
    nnoremap <Leader>ev :vsplit $MYVIMRC<CR>

    " Source .vimrc
    nnoremap <Leader>sv :source $MYVIMRC<CR>

    " Surround word in quotes
    nnoremap " ciw"<C-r>""<esc>


    " Add comments to js files with <Leader>c
    autocmd FileType javascript nnoremap <localleader>c I// <esc>
    autocmd FileType go nnoremap <localleader>c I// <esc>

" Status Line
    set laststatus=2
    let g:NERDTreeStatusline = '%#NonText#'
    set noshowmode
    " set statusline=
    " set statusline+=%=
    " set statusline+=col:\ %c

" Command-T
    if &term =~ "xterm" || &term =~ "screen"
        let g:CommandTCancelMap = ['<ESC>', '<C-c>']
    endif
    set wildignore+=node_modules


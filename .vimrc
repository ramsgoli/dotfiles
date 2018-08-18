" Plugins
    call plug#begin('~/.vim/plugged')
    Plug 'tomasiser/vim-code-dark'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    Plug 'yssl/QFEnter'
    Plug 'bronson/vim-trailing-whitespace'
    Plug 'wincent/command-t'
    Plug 'scrooloose/nerdtree'
    Plug 'valloric/YouCompleteMe'
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

    if $TERM_PROGRAM =~ "iTerm"
        let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
        let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
    endif

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
    set statusline=
    set statusline+=%=
    set statusline+=col:\ %c

" Command-T
    if &term =~ "xterm" || &term =~ "screen"
        let g:CommandTCancelMap = ['<ESC>', '<C-c>']
    endif
    set wildignore+=node_modules


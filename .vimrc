" Plugins
    call plug#begin('~/.vim/plugged') 
    Plug 'tomasiser/vim-code-dark'
    Plug 'pangloss/vim-javascript'
    Plug 'maxmellon/vim-jsx-pretty'
    call plug#end()
    execute pathogen#infect()

" Tab
    set shiftwidth=4
    set softtabstop=4
    set expandtab
    set tabstop=4

" Editor niceties
    set splitright
    set cursorline
    filetype plugin indent on
    set nu
    syntax enable
    set ruler  " column number

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
    let NERDTreeIgnore = ['\.o$', '\.out$']

    " open nerdtree with Ctrl-n
    map <C-n> :NERDTreeToggle<CR> 

    " Map fugitive git commands to more friendlier ones
    nmap :gs<CR> :Gstatus<CR>

" Key mappings
    let mapleader = ";"

    map <Leader>s :w<CR>
    map <Leader>q :q<CR>

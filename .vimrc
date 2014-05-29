set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'kien/ctrlp.vim'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

" Automatically dismiss hint from YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion = 1
" Disable syntastic's automatically checking
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <leader>c :SyntasticCheck<CR> :SyntasticToggleMode<cr>
let g:ctrlp_custom_ignore = '\v.+\.pyc'

" To prevent some exploit
set modelines=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" UI settings for graphic versions
set guioptions=

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set wildmenu
set wildmode=list:longest
set ttyfast
set cursorline
set encoding=utf-8
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set autoindent      " always set autoindenting on
set relativenumber
set undofile        " undo function after reopening
set backupdir=/tmp
set undodir=/tmp
set cuc

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch       " do incremental searching
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>

syntax on

" Color Scheme
"set background=dark
"let g:solarized_termtrans = 1
"colorscheme solarized
let g:molokai_original = 1
colorscheme molokai

" handle long lines correctly
set wrap
set textwidth=78
set formatoptions=qrn1
set colorcolumn=80

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" easy split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a
set clipboard=unnamed

let g:indent_guides_guide_size=1

inoremap <F1> <Esc>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>a :NERDTree<cr>
nnoremap <leader>w :Gstatus<cr>
nnoremap <leader>d :TagbarToggle<cr>


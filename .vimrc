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
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'majutsushi/tagbar'
Plugin 'fatih/vim-go'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'altercation/vim-colors-solarized'
Plugin 'mxw/vim-jsx'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mileszs/ack.vim'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

" Ignore some files for ctrlp
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$|build$',
  \ 'file': '\v\.(exe|so|dll|o|pyc)$',
  \ }


set statusline=
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Auto save
:au FocusLost * silent! wa


" To prevent some exploit
set modelines=0

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

set wildmenu
set wildmode=list:longest
set cursorline
set encoding=utf-8
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set autoindent      " always set autoindenting on
set relativenumber
set number
set undofile        " undo function after reopening
set backupdir=/tmp
set undodir=/tmp
set scrolljump=-33
" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch       " do incremental searching
set hlsearch
nnoremap <leader><space> :noh<cr>

syntax on

" tabs

nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Color Scheme
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
"let g:molokai_original = 1
"colorscheme molokai

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
nnoremap <leader>a :NERDTreeTabsToggle<cr>
nnoremap <leader>w :Gstatus<cr>
nnoremap <leader>d :TagbarToggle<cr>
nnoremap <leader>f :FixWhitespace<cr>
autocmd BufRead,BufNewFile   *.go set noet
autocmd BufRead,BufNewFile   *.txt let g:AutoPairsMapSpace = 0

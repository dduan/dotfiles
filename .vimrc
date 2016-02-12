set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
Plugin 'keith/swift.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
"Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'mxw/vim-jsx'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'mileszs/ack.vim'
Plugin 'tpope/vim-surround'
Plugin 'bling/vim-airline'
Plugin 'shime/vim-livedown'
Plugin 'rust-lang/rust.vim'
Plugin 'begriffs/haskell-vim-now'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

let mapleader = ","

" Ignore some files for ctrlp
let g:ctrlp_custom_ignore = {
 \ 'dir':  '\v[\/]\.(git|hg|svn)$|build$',
 \ 'file': '\v\.(exe|so|dll|o|pyc)$',
 \ }

" No scrollbars thank you
set guioptions-=r
set guioptions-=L

set statusline=
set laststatus=2
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
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
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
set scrolljump=-15
" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch       " do incremental searching
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap j gj
nnoremap k gk

syntax on

" tabs

nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Color Scheme
set background=dark
"let g:solarized_termtrans = 1
colorscheme molokai

" handle long lines correctly
set wrap
set textwidth=78
set formatoptions=qrn1
set colorcolumn=80

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬


" quirk of NeoVim
if has('nvim')
 nmap <BS> <C-h>
endif

" easy split window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

if has('nvim')
 nnoremap <C-t>t :split <bar> :term<cr>
 nnoremap <C-t>v :vsplit <bar> :term<cr>
endif

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a
set clipboard=unnamed

let g:indent_guides_guide_size=1

inoremap <F1> <Esc>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>w :Gstatus<cr>
nnoremap <leader>e :TagbarToggle<cr>
nnoremap <leader>f :FixWhitespace<cr>
nnoremap <leader>t :CtrlPTag<cr>
if has('nvim')
    tnoremap <C-h> <C-\><C-n><C-w>h
    tnoremap <C-j> <C-\><C-n><C-w>j
    tnoremap <C-k> <C-\><C-n><C-w>k
    tnoremap <C-l> <C-\><C-n><C-w>l
    nnoremap <leader>m :w <bar> rightbelow vertical split <bar> :term make<cr>
else
    nnoremap <leader>m :w <bar> :make<cr>
endif

noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
" Command-0 goes to the last tab
noremap <D-0> :tablast<CR>

autocmd BufRead,BufNewFile   *.go set noet
autocmd BufRead,BufNewFile   *.txt let g:AutoPairsMapSpace = 0
autocmd BufRead,BufNewFile   *.md nnoremap <leader>m :LivedownPreview<cr>

" make CtrlP faster
 let g:ctrlp_use_caching = 0
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor

    let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
  let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
  let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
    \ }
endif

let g:airline_powerline_fonts = 1
let g:vimshell_editor_command = '/usr/local/Cellar/macvim/7.4-73_1/MacVim.app/Contents/MacOS/MacVim'
let g:rustfmt_autosave = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

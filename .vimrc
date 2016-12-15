set nocompatible              " be iMproved, required
filetype off                  " required

" use dein.vim for package management
if has('nvim')
  set rtp+=~/.config/nvim/dein.vim
  call dein#begin('~/.config/nvim')
else
  set rtp+=~/.vim/dein.vim
  call dein#begin('~/.vim')
endif
call dein#add('Shougo/dein.vim')
call dein#add('tpope/vim-fugitive')
call dein#add('scrooloose/nerdtree')
call dein#add('scrooloose/nerdcommenter')
call dein#add('kien/ctrlp.vim')
call dein#add('jiangmiao/auto-pairs')
call dein#add('majutsushi/tagbar')
call dein#add('fatih/vim-go')
call dein#add('keith/swift.vim')
call dein#add('keith/sourcekittendaemon.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('godlygeek/tabular')
call dein#add('plasticboy/vim-markdown')
call dein#add('jnurmine/Zenburn')
call dein#add('bronson/vim-trailing-whitespace')
call dein#add('mileszs/ack.vim')
call dein#add('tpope/vim-surround')
call dein#add('bling/vim-airline')
call dein#add('rust-lang/rust.vim')
call dein#add('duff/vim-scratch')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('machakann/vim-highlightedyank')
if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('mitsuse/autocomplete-swift')
endif
call dein#end()

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
"set macligatures
set guifont=Menlo\ for\ Powerline:h13
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
set number
set undofile        " undo function after reopening
set backupdir=/tmp
set undodir=/tmp
set scrolljump=-15

set autoread
" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set incsearch       " do incremental searching
set hlsearch
nnoremap j gj
nnoremap k gk
set clipboard=unnamed
syntax on

" tabs

nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Color Scheme
set background=dark
"let g:solarized_termtrans = 1
colorscheme zenburn

" handle long lines correctly
set wrap
set textwidth=80
set colorcolumn=80
set formatoptions=qrn1

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

" Don't use Ex mode, use Q for formatting
map Q gq

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

let g:indent_guides_guide_size=1

inoremap <F1> <Esc>
inoremap <C-c> <Esc>:w<CR>
nnoremap <leader><space> :noh<cr>
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>a :NERDTreeToggle<cr>
nnoremap <leader>w :Gstatus<cr>
nnoremap <leader>e :TagbarToggle<cr>
nnoremap <leader>f :FixWhitespace<cr>
nnoremap <leader>t :CtrlPTag<cr>
nnoremap <leader>s :Scratch<cr>

if has('nvim')
  nnoremap <C-t>t :split <bar> :term<cr>
  nnoremap <C-t>v :vsplit <bar> :term<cr>
  tnoremap <C-h> <C-\><C-n><C-w>h
  tnoremap <C-j> <C-\><C-n><C-w>j
  tnoremap <C-k> <C-\><C-n><C-w>k
  tnoremap <C-l> <C-\><C-n><C-w>l
  nnoremap <leader>m :w <bar> rightbelow vertical split <bar> :term make<cr>
else
    nnoremap <leader>m :w <bar> :make<cr>
endif

cmap W w
cmap Wq wq

autocmd BufRead,BufNewFile   *.go set noet
autocmd BufRead,BufNewFile   *.txt let g:AutoPairsMapSpace = 0
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2

" make CtrlP faster
let g:ctrlp_use_caching = 0
let g:ctrlp_user_command = ['.git', 'find %s -type f']
let g:ctrlp_prompt_mappings = {
\ 'AcceptSelection("e")': ['<space>', '<cr>', '<2-LeftMouse>'],
\ }

let g:airline_powerline_fonts = 0
let g:vim_markdown_folding_disabled = 1

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_swift_checkers = ['swiftpm', 'swiftlint']
let g:deoplete#enable_at_startup = 1
let g:loaded_sql_completion = 0

" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 0
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
        let g:wide_column = 0
    else
        set textwidth=110
        set colorcolumn=110
        let g:wide_column = 1
    endif
endfunction

nnoremap tt "=strftime("%F %T%z")<CR>p
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

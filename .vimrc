set nocompatible              " be iMproved, required
filetype off                  " required

" use dein.vim for package management
set rtp+=~/.vim/repos/github.com/Shougo/dein.vim
let dein_base = '~/.vim'
if dein#load_state(dein_base)
    call dein#begin(dein_base)
    call dein#add('Shougo/dein.vim')
    call dein#add('tpope/vim-fugitive')
    call dein#add('scrooloose/nerdtree')
    call dein#add('scrooloose/nerdcommenter')
    call dein#add('jiangmiao/auto-pairs')
    call dein#add('majutsushi/tagbar')
    call dein#add('fatih/vim-go')
    call dein#add('keith/swift.vim')
    call dein#add('cespare/vim-toml')
    call dein#add('airblade/vim-gitgutter')
    call dein#add('godlygeek/tabular')
    call dein#add('plasticboy/vim-markdown')
    call dein#add('jnurmine/Zenburn')
    call dein#add('bronson/vim-trailing-whitespace')
    call dein#add('mileszs/ack.vim')
    call dein#add('tpope/vim-surround')
    call dein#add('bling/vim-airline')
    call dein#add('rust-lang/rust.vim')
    call dein#add('christoomey/vim-tmux-navigator')
    call dein#add('machakann/vim-highlightedyank')
    call dein#add('junegunn/fzf')
    call dein#add('tpope/vim-rhubarb')
    call dein#add('neomake/neomake')
    call dein#add('w0rp/ale')
    call dein#end()
    call dein#save_state()
endif

filetype plugin indent on    " required

let mapleader = ","

" .swp location
set directory=$HOME/.vim/swapfiles//

" Nicer line joining (J)
set formatoptions+=j

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

set ttyfast
set wildmenu
set wildmode=list:longest
set cursorline
set encoding=utf-8
set history=50      " keep 50 lines of command line history
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set autoindent      " always set autoindenting on
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
set diffopt+=vertical
syntax on

" tabs

nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Color Scheme
set background=dark
"let g:solarized_termtrans = 1
colorscheme Zenburn

" handle long lines correctly
set wrap
set textwidth=110
set colorcolumn=110
set formatoptions=qrn1

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

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
vnoremap <leader>s :'<,'>!sort -f<cr>
nnoremap <leader>d :ALEGoToDefinition<cr>
nnoremap <leader>m :Nrun make<cr>
nnoremap <C-p> :FZF<cr>

cmap Wq wq
cmap W w

autocmd BufRead,BufNewFile   *.wat set ft=lisp
autocmd BufRead,BufNewFile   *.gyb set ft=swift
autocmd BufRead,BufNewFile   *.go set noet
autocmd BufRead,BufNewFile   *.txt let g:AutoPairsMapSpace = 0
autocmd FileType cpp setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType haskell set formatprg=stylish-haskell

if executable('rg')
  let g:ackprg = '/usr/local/bin/rg --vimgrep'
endif

let g:airline_powerline_fonts = 0
let g:vim_markdown_folding_disabled = 1

set statusline+=%#warningmsg#
set statusline+=%*

let g:deoplete#enable_at_startup = 1
let g:loaded_sql_completion = 0
let g:NERDCustomDelimiters = { 'swift': { 'left': '// ' } }
let g:NERDDefaultAlign = 'left'
let g:ale_completion_enabled = 1

" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 1
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

let g:neomake_open_list = 2

command! -nargs=+ Nrun call<sid>Nrun("<args>")
function! s:Nrun(args)
  let l:arguments = split(a:args)
  let l:executable = remove(l:arguments, 0)
  let l:arguments = join(l:arguments, ' ')

  let l:maker = {
        \ 'exe': l:executable,
        \ 'args': l:arguments,
        \ 'errorformat': &errorformat,
      \ }
  call neomake#Make(0, [l:maker])
endfunction

nnoremap tt "=strftime("%F %T%z")<CR>p
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
nnoremap <silent> <Leader>> :exe "vertical resize " . (winwidth(0) * 3/2)<CR>
nnoremap <silent> <Leader>< :exe "vertical resize " . (winwidth(0) * 2/3)<CR>

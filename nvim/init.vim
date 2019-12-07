" Habit
let mapleader = ","

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/plugged')
" Use NerdTree for file browsing
Plug 'scrooloose/nerdtree'

" Move to and from Tmux panes and Vim panes
Plug 'christoomey/vim-tmux-navigator'

" Syntax For languages
Plug 'keith/swift.vim'
Plug 'fatih/vim-go'
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'
Plug 'uarun/vim-protobuf'
Plug 'plasticboy/vim-markdown'
Plug 'rust-lang/rust.vim'

" Nice status bar
Plug 'bling/vim-airline'

" Color Scheme
Plug 'tomasr/molokai'

" Auto close parens, braces, brackets, etc
Plug 'jiangmiao/auto-pairs'

" Convenience for commenting things in and out
Plug 'scrooloose/nerdcommenter'

" Highlight trailing whitespaces
Plug 'ntpeters/vim-better-whitespace'

" Show git stuff in gutter
Plug 'airblade/vim-gitgutter'

" Indicator for what was yanked
Plug 'machakann/vim-highlightedyank'

" Git integration glore
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Fuzzy finder
Plug 'junegunn/fzf'

" Better than grepprg
Plug 'mileszs/ack.vim'

" Aligning stuff
Plug 'junegunn/vim-easy-align'

" Language Protocol Server and autocompelete
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-vim-lsp'

" update &runtimepath and initialize plugin system
" Automatically executes `filetype plugin indent` on and `syntax enable`.
call plug#end()

" Color Scheme
let g:molokai_original = 1
colorscheme molokai

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Numbers
set number

" In many terminal emulators the mouse works just fine, thus enable it.
set mouse=a

" Searching
nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase

" Highlight the line the cursor is on.
set cursorline

" show the cursor position all the time
set ruler

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" read/write file when switching buffers
set autowrite
set autoread

" tab settings
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set smarttab

" Automatic indentation is good
set autoindent

" Undo function after reopening
set undofile
set undodir=/tmp

" macOS clipboard sharing
set clipboard=unnamed

" accelerated scrolling
set scrolljump=-15

" See help fo
set formatoptions=qrnj1

" List candidates in wildmenu after tabbing, complete longest common part in
" matched results. Tabbing again will trigger selection among the matches.
set wildmode=list:longest,full

" better vertial movement for wrapped lines
nnoremap j gj
nnoremap k gk

" quickly cancel search highlighting
nnoremap <leader><space> :nohlsearch<cr>

" Strip all trailing whitespace
nnoremap <leader>f :StripWhitespace<cr>

" Replace <Esc> with C-c
inoremap <F1> <Esc>
inoremap <C-c> <Esc>
nnoremap <C-c> :wa<cr>

" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>
" Close vim if the last window open is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" I type Wq more often than wq
cmap Wq wq

" [scrooloose/nerdcommenter]
" Don't be too smart across lines
let g:AutoPairsMultilineClose=0
" Don't insert extra spaces
let g:AutoPairsMapSpace=0

" Use arrow keys to switch tabs
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Column limits
set textwidth=110
set colorcolumn=110
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

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" FZF
if executable('fzf')
    nnoremap <C-p> :FZF<cr>
endif

" Quickly insert a timestamp
nnoremap tt "=strftime("%F %T%z")<CR>p

" [mileszs/ack.vim]
if executable('rg')
  let g:ackprg = '/usr/local/bin/rg --vimgrep'
  nnoremap <leader>r :Ack! 
endif

" Toggle quickfix windown
nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ''
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction

" Git status
nnoremap <leader>w :Gstatus<cr>

" Make workflow
nnoremap <leader>m :let &makeprg=""<left>
nnoremap <silent> <Leader>b :cclose<cr>:silent !clear<cr>:make<cr>

" LSP and autocomplete
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=cI
nnoremap <leader>e :LspHover<cr>
nnoremap <leader>d :LspDefinition<cr>

" Don't use Ex mode, use Q for formatting
map Q gq

" Map filetypes
autocmd BufRead,BufNewFile   *.wat set ft=lisp
autocmd BufRead,BufNewFile   *.gyb set ft=swift

" [scrooloose/nerdcommenter] Use // for comments
let g:NERDCustomDelimiters = { 'swift': { 'left': '// ' }, 'c': { 'left': '// '} }
let g:NERDDefaultAlign = 'left'

if executable('clangd')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'clangd',
        \ 'cmd': {server_info->['clangd', '-background-index']},
        \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
        \ })
endif

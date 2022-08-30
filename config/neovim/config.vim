{ ripgrep }:
''
" Habit
let mapleader = ","

" Display hidden characters
set list
set listchars=tab:▸\ ,eol:¬

" Numbers
set number
set relativenumber

" Git Gutter always shows
set signcolumn=yes

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
set clipboard=unnamedplus

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

" I type Wq more often than wq
cmap Wq wq

" Use arrow keys to switch tabs
nnoremap <Left> :tabprevious<CR>
nnoremap <Right> :tabnext<CR>

" Column limits
set textwidth=80
set colorcolumn=80
" Toggle between column widths
nnoremap <leader>c :call ToggleColumnWidth()<cr>
let g:wide_column = 0
function! ToggleColumnWidth()
    if g:wide_column
        set textwidth=80
        set colorcolumn=80
    let g:wide_column = 0
    else
        set textwidth=100
        set colorcolumn=100
        let g:wide_column = 1
    endif
endfunction

" Sort lines in alphabetical order
vnoremap <leader>s :'<,'>!sort -f<cr>

" Quickly insert a timestamp
nnoremap tt "=strftime("%FT%T")<CR>p"=strftime("%z")<CR>phi:<esc>
" Toggle quickfix windown
nnoremap <leader><leader> :call ToggleQuickfix()<cr>
function! ToggleQuickfix()
  for buffer in tabpagebuflist()
    if bufname(buffer) == ""
      " then it should be the quickfix window
      cclose
      return
    endif
  endfor

  copen
endfunction
" Make workflow
nnoremap <leader>m :let &makeprg=""<left>
nnoremap <silent> <Leader>b :cclose<cr>:silent !clear<cr>:make<cr>

set completeopt=noinsert,menuone,noselect
" When the <Enter> key is pressed while the popup menu is visible, it only
" hides the menu. Use this mapping to close the menu and also start a new
" line.
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
" suppress the annoying 'match x of y', 'The only match' and 'Pattern not
" found' messages
set shortmess+=cI

" Don't use Ex mode, use Q for formatting
map Q gq

" Map filetypes
autocmd BufRead,BufNewFile   *.wat set ft=lisp
autocmd BufRead,BufNewFile   *.gyb set ft=swift

" [Auto Pairs]
" Don't be too smart across lines
let g:AutoPairsMultilineClose=0
" Don't insert extra spaces
let g:AutoPairsMapSpace=0

" [Ack.vim]
if executable('rg')
  let g:ackprg = '${ripgrep}/bin/rg --vimgrep'
  nnoremap <leader>r :Ack!
endif

" [Molokai]
let g:molokai_original = 1
colorscheme molokai

" [Nerdcommenter]
let g:NERDCustomDelimiters = {}
let g:NERDCustomDelimiters['nix'] = { 'left': '# ' }
let g:NERDCustomDelimiters['swift'] = { 'left': '// ' }
let g:NERDDefaultAlign = 'left'

" [Nerdtree]
" Toggle NerdTree
nnoremap <leader>a :NERDTreeToggle<cr>
" Close vim if the last window open is NerdTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" [vim-fugitive]
nnoremap <leader>w :Git<cr>

" Jump to definition
nnoremap <leader>j :lua vim.lsp.buf.definition()<cr>

" Show LSP hover
nnoremap <leader>h :lua vim.lsp.buf.hover()<cr>

" [vim-markdown]
" No folding
let g:vim_markdown_folding_disabled = 1

" [fzf]
if executable('fzf')
    nnoremap <C-p> :FZF<cr>
endif

" no folding
set nofoldenable

lua << EOF
require'lspconfig'.sourcekit.setup{
  cmd = { "sourcekit-lsp" }
}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.pyright.setup{}
-- Compe setup
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    nvim_lsp = true;
  };
}

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<Tab>"
  else
    return vim.fn['compe#complete']()
  end
end
_G.s_tab_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<S-Tab>"
  end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
EOF


function! FormatNix()
  silent !nixpkgs-fmt %
  e
endfunction

autocmd BufWritePost *.nix :call FormatNix()

let g:rustfmt_autosave = 1
let g:cargo_makeprg_params = 'check'

vnoremap <leader>t :EasyAlign *\|<cr>
''

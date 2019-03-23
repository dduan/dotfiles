" [scrooloose/nerdcommenter] Use // for comments
let g:NERDCustomDelimiters = { 'swift': { 'left': '// ' } }
let g:NERDDefaultAlign = 'left'

" LSP and autocomplete
if executable('sourcekit-lsp')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->['sourcekit-lsp']},
        \ 'whitelist': ['swift'],
        \ })
endif

" Error detection
set efm=
set efm+=%f:%l:%c:\ %trror:%m
set efm+=%f:%l:%c:\ %tarning:%m
set efm+=%f:%l:\ %trror:%m
set efm+=%f:%l:\ %tarning:%m

" [scrooloose/nerdcommenter] Use // for comments
let g:NERDCustomDelimiters = { 'swift': { 'left': '// ' } }
let g:NERDDefaultAlign = 'left'

let g:sourcekitlsp = '/Applications/Xcode-beta.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/sourcekit-lsp'
if executable(g:sourcekitlsp)
    " LSP and autocomplete
    au User lsp_setup call lsp#register_server({
        \ 'name': 'sourcekit-lsp',
        \ 'cmd': {server_info->[g:sourcekitlsp, '-c', 'release']},
        \ 'whitelist': ['swift'],
        \ })
endif

" Error detection
set efm=
set efm+=%f:%l:%c:\ %trror:%m
set efm+=%f:%l:%c:\ %tarning:%m
set efm+=%f:%l:\ %trror:%m
set efm+=%f:%l:\ %tarning:%m

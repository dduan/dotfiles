let g:NERDCustomDelimiters['nix'] = { 'left': '# ' }

function! FormatNix()
    silent !nixpkgs-fmt %
    e
endfunction
autocmd BufWritePost *.nix :call FormatNix()

Settings here are specifically to be included as part of neovim.nix. It's not "vanilla" vimscript! Notably,
nice things such as Vim's ftplugins file structure must be manually implemented with `autocmd BufNewFile,BufRead *.xxx source xxx.vim`

set nocompatible
filetype plugin indent on

syntax on
set nu

packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('justinmk/vim-sneak')
call minpac#add('tpope/vim-scriptease', {'type':'opt'})
call minpac#add('k-takata/minpac', {'type':'opt'})

# run fzf on ctrl + p
nnoremap <C-p> :<C-u>FZF<CR>

# execute ctags when press f5
nnoremap <f5> :!ctags -R <CR>

# execute ctags when file save
autocmd BufWritePost * call system("ctags -R")

set nocompatible
filetype plugin indent on

syntax on

" set nu
set rnu

" setting up tabs
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2	

packadd minpac
call minpac#init()
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-repeat')
call minpac#add('justinmk/vim-sneak')
call minpac#add('tpope/vim-projectionist')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-dispatch')
call minpac#add('kassio/neoterm')
call minpac#add('tpope/vim-scriptease', {'type':'opt'})
call minpac#add('k-takata/minpac', {'type':'opt'})

" run fzf on ctrl + p
nnoremap <C-p> :<C-u>FZF<CR>

" execute ctags when press f5
nnoremap <f5> :!ctags -R <CR>

" execute ctags when file save
autocmd BufWritePost * call system("ctags -R")

" setup neovim terminal
let g:neoterm_size = 10
let g:neoterm_autoinsert = 0
let g:neoterm_autoscroll = 1

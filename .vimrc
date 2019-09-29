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

" fzf setting
" set rtp+=/usr/local/opt/fzf

packadd minpac
call minpac#init()

call minpac#add('vim-scripts/ReplaceWithRegister')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-repeat')
call minpac#add('tpope/vim-surround')
call minpac#add('justinmk/vim-sneak')
call minpac#add('easymotion/vim-easymotion')
call minpac#add('tpope/vim-projectionist')
call minpac#add('radenling/vim-dispatch-neovim')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('tpope/vim-dispatch')
call minpac#add('kassio/neoterm')
call minpac#add('w0rp/ale')

" related to fzf
" call minpac#add('/usr/local/opt/fzf')
" call minpac#add('junegunn/fzf.vim')
call minpac#add('kien/ctrlp.vim')

call minpac#add('tpope/vim-scriptease', {'type':'opt'})
call minpac#add('k-takata/minpac', {'type':'opt'})

" javascript related plugins
call minpac#add('pangloss/vim-javascript')
call minpac#add('Quramy/tsuquyomi')
call minpac#add('leafgarland/typescript-vim')

" run fzf on ctrl + p
" nnoremap <C-p> :<C-u>FZF<CR>
" nnoremap <C-p> :<C-u>CtrlP<CR>


" execute ctags when file save
" too slow...
" autocmd BufWritePost * call system("ctags -R")

" setup neovim terminal
let g:neoterm_size = 10
let g:neoterm_autoinsert = 0
let g:neoterm_autoscroll = 1

" ctrlp vim related settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" ale setting
let g:ale_linters = { 
      \  'javascript' : ['eslint'],
      \ }
let g:ale_fix_on_save = 1
let g:ale_lint_on_text_changed = 'always' " default
let g:ale_lint_on_save = 1 " default
let g:ale_lint_on_enter = 1 " default
let g:ale_lint_on_filetype_changed = 1 " default
let g:ale_sign_column_always = 1 " add this if you want gutter to be always appeared

" key mappings
" execute ctags when press f5
nnoremap <f5> :!ctags -R <CR>

" ale key mapping
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

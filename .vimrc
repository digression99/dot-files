set nocompatible
" if there's ftplugin, make it usable.
filetype plugin indent on

" show syntax highlighting
syntax on

" show numbers
" set nu
set rnu

" set search setting
set ignorecase
set smartcase

" setting up tabs
set smartindent
set tabstop=2
set expandtab
set shiftwidth=2	

" undo related setting
set undofile
set undodir=$VIMDATA/undo

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
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko/vim-test')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-obsession')

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

" nerdtree mapping
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let g:NERDTreeShowHidden=1

" START - vim-grepper configuration
let g:grepper = {}
let g:grepper.tools = [ 'ag', 'git', 'rg', 'grep' ]

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR> 

" Search for the current selection
nmap gs <plug>(GrepperOperator) 
xmap gs <plug>(GrepperOperator)

" END - vim-grepper configuration

" quickfix list move
nmap <silent> [C :cfirst<CR>
nmap <silent> [c :cprev<CR>
nmap <silent> ]c :cnext<CR>
nmap <silent> ]C :clast<CR>

" Grepper setting
nnoremap <Leader>g :Grepper -tool ag<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" vim-test setting
let test#strategy = "dispatch"

" remove highlight search 
nnoremap <silent> <C-l> :<C-u>nohlsearch<CR><C-l>

" neovim terminal setting
:tnoremap <Esc> <C-\><C-n>

if has('nvim')
    tnoremap <Esc> <C-\><C-n>
    tnoremap <C-v><Esc> <Esc>
endif

" create terminal buffer
nnoremap <silent> <C-k> :<C-u>sp \| wincmd j <Bar> resize 20 <Bar> te<CR><C-l>

" START - vim-easymotion setting
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

map <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

map <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

let g:EasyMotion_smartcase = 1
" END - vim-easymotion setting

if has('nvim') && executable('nvr')
    let $VISUAL="nvr -cc split --remote-wait + 'set bufhidden=wipe'"
endif


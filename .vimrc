set nocompatible
set encoding=utf8

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


" START - undo related setting
set undofile

if !has('nvim')
    set undodir=~/.vim/undo
else
    set undodir=$VIMDATA/undo
endif
augroup vimrc
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END
" END - undo related setting

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
call minpac#add('jiangmiao/auto-pairs')

call minpac#add('tpope/vim-dispatch')
call minpac#add('radenling/vim-dispatch-neovim')

call minpac#add('kassio/neoterm')
call minpac#add('scrooloose/nerdtree')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('mhinz/vim-grepper')
call minpac#add('janko/vim-test')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('mattn/emmet-vim')
call minpac#add('tpope/vim-obsession')
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('morhetz/gruvbox')
call minpac#add('terryma/vim-multiple-cursors')
call minpac#add('mhinz/vim-startify')
call minpac#add('romainl/vim-qf')

" Setting up snippets
call minpac#add('SirVer/ultisnips')
call minpac#add('honza/vim-snippets')
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit="vertical"

" START - Language support plugins
" call minpac#add('w0rp/ale')

" if has('nvim')
"     call minpac#add('Shougo/deoplete.nvim', { 'do' : ':UpdateRemotePlugins' })
" else
"    call minpac#add('Shougo/deoplete.nvim')
"     call minpac#add('roxma/nvim-yarp')
"     call minpac#add('roxma/vim-hug-neovim-rpc')
" endif
" let g:deoplete#enable_at_startup = 1

" installing coc.nvim
" branch fetching doesn't work. you need to checkout manually inside coc.nvim
call minpac#add('neoclide/coc.nvim', { 'branch' : 'release' })
call minpac#add('neoclide/coc.nvim', { 'tag' : '*', 'branch' : 'release' })
call minpac#add('neoclide/coc.nvim', { 'do' : 'yarn install --frozen-lockfile' })
" END - Language support plugins

" related to fzf
" call minpac#add('/usr/local/opt/fzf')
" call minpac#add('junegunn/fzf.vim')
call minpac#add('ctrlpvim/ctrlp.vim')

call minpac#add('tpope/vim-scriptease', {'type':'opt'})
call minpac#add('k-takata/minpac', {'type':'opt'})

" javascript related plugins
call minpac#add('pangloss/vim-javascript')
call minpac#add('Quramy/tsuquyomi')
call minpac#add('leafgarland/typescript-vim')

call minpac#add('ryanoasis/vim-devicons')

" START - setup vim devicons
" You need to install nerd fonts before using this.
" https://github.com/ryanoasis/nerd-fonts#patched-fonts
set guifont=Droid\ Sans\ Mono\ for\ Powerline\ Plus\ Nerd\ File\ Types:h11
" END - setup vim devicons


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

" START - ctrlp vim related settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn))$'
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
" END - ctrlp vim related settings

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
map <C-b> :NERDTreeToggle<CR>
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

" Related to color scheme
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
colorscheme gruvbox

" START - Git gutter setting
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
" END - Git gutter setting
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)

let g:airline_powerline_fonts = 1

syntax on
filetype plugin indent on
"#################################
"# General settings for vim      # 
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set encoding=utf-8
set incsearch
"#remember to set Ln -s target_path link_path in terminal
set rtp+=~/university/current_course
"#Correcting spelling mistakes on the fly
setlocal spell
set spelllang=en_us
set foldmethod=manual

"#################################
"# Plugins                       # 
"#################################

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'SirVer/ultisnips'
Plug 'habamax/vim-polar'

Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ycm-core/YouCompleteMe'
"Plug 'git@github.com:kien/ctrlp.vim.git'
Plug 'mbbill/undotree'



call plug#end()

"#################################
"# vim Tex settings              # 
"#################################

let g:tex_flavor='latex'
let g:vimtex_view_method='general'
let g:vimtex_view_general_viewer='zathura'
"#let g:vim Tex_fold_enabled=1
let g:vimtex_quickfix_mode=0
set conceallevel=2
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none


"#################################
"# Buttons of the Multi Snips    # 
"#################################

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit= "vertical"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigglr="<c-k>"

"#################################
"# Window sizing                 #
"#################################
"
if executable('rg')
    let g:rg_derive_root='true'
endif
    
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
let mapleader = " "
let g:netrw_browse_split=2
let g:netrw_banner=0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <Leader>ps :Rg<SPACE>
nnoremap <silent> <Leader>+ :vertical resize +5<CR>
nnoremap <silent> <Leader>- :vertical resize -5<CR>
nnoremap <leader>tm :term ++rows=15<CR>

"#################################

set termguicolors
colorscheme polar

augroup colorscheme_change | au!
    au ColorScheme polar hi Comment gui=italic cterm=italic
augroup END


"#################################
"#  Mappings                     # 
"#################################

inoremap jj <Esc>:w<CR>:mkview<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <leader>s :w<CR>
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-b> : silent exec '!gnome-terminal -- python3 /home/whiffen/inkscape-shortcut-manager/main.py; inkscape-figures watch' <CR><CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
"#correcting spelling mistakes on the fly Giles Castle
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <F2> :set nonumber!<CR>


"#################################
"# Lines to save text folding    # 
"#################################
"
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent! loadview

"###################################################
"# comment highlighting. json with comment support #
"###################################################

autocmd FileType json syntax match Comment +\/\/.\+$+

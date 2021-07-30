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
Plug 'morhetz/gruvbox'
Plug 'SirVer/ultisnips'
Plug 'dylanaraps/wal.vim'
Plug 'habamax/vim-polar'
Plug 'neovimhaskell/haskell-vim'
Plug 'derekwyatt/vim-scala'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'Honda/vim-snippets'
"Plug 'cm-core/You Complete Me'

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
"# Buttons of the Multi Snips      # 
"#################################

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsEditSplit= "vertical"
let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigglr="<c-k>"


let mapleader = " "

"#################################
"#  Syntax for haskell           # 
"#################################

let g:haskell_enable_quantification = 1   " to enable highlighting of `forall`
let g:haskell_enable_recursivedo = 1      " to enable highlighting of `mdo` and `rec`
let g:haskell_enable_arrowsyntax = 1      " to enable highlighting of `proc`
let g:haskell_enable_pattern_synonyms = 1 " to enable highlighting of `pattern`
let g:haskell_enable_typeroles = 1        " to enable highlighting of type roles
let g:haskell_enable_static_pointers = 1  " to enable highlighting of `static`
let g:haskell_backpack = 1                " to enable highlighting of backpack keywords


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

syntax on
"#################################
"# General settings for vim      # 
filetype plugin indent on
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
set textwidth=72
set wrapmargin=72
set formatoptions+=t
set relativenumber


"#################################
"# Plugins                       # 
"#################################

call plug#begin('~/.vim/plugged')

Plug 'lervag/vimtex'
Plug 'chriskempson/base16-vim'
Plug 'arcticicestudio/nord-vim'
Plug 'cormacrelf/vim-colors-github'
Plug 'KeitaNakamura/tex-conceal.vim'
Plug 'SirVer/ultisnips'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
Plug 'lyuts/vim-rtags'
Plug 'ycm-core/YouCompleteMe'
Plug 'morhetz/gruvbox'
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
hi Normal ctermbg=none

"#################################
"# You complete me               #
"#################################

let g:ycm_key_list_select_completion = ['<Enter>', '<Down>']


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

"let g:gruvbox_italic=1 
"let g:gruvbox_guisp_fallback = "bg"
"let g:gruvbox_termcolors=16
"set background=dark
"set termguicolors
colorscheme github
"
"let base16colorspace=256  " Access colors present in 256 colorspace
"colorscheme base16--dark

hi clear SpellBad
hi clear SpellCap
hi clear SpellLocal
hi clear SpellRare

hi SpellBad cterm=standout
hi SpellBad ctermfg=red
hi SpellBad guifg=Red
"hi SpellCap cterm=standout
"hi SpellCap ctermfg=lightgreen
"hi SpellCap guifg=DarkCyan

hi MatchParen cterm=None
hi MatchParen ctermbg=black
hi MatchParen ctermfg=white


"#################################
""#  Mappings                     # 
"#################################

nnoremap - ddp
nnoremap _ ddkkp
inoremap <c-u> <esc>lbveU<esc>wi
nnoremap <c-u> lbveU<esc>w



inoremap jk <Esc>:w<CR>:mkview<CR>
nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>
nnoremap <leader>s :w<CR>
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-b> : silent exec '!gnome-terminal -- python3 /home/whiffen/inkscape-shortcut-manager/main.py; inkscape-figures watch' <CR><CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>
"#correcting spelling mistakes on the fly Giles Castle
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u
nnoremap <F2> :set nonumber!<CR>
nnoremap <S-Enter> O<Esc>
nnoremap <CR> o<Esc>

"#################################
"# Lines to save text folding    # 
"#################################
"
augroup filetype_tex
    autocmd!
    autocmd BufWinLeave *.* mkview
    autocmd FileType tex setlocal textwidth=56 wrapmargin=56
    autocmd FileType html setlocal shiftwidth=100 tabstop=100
   autocmd BufWinEnter *.* silent! loadview
   autocmd FileType matlab setlocal nospell
augroup END
"###################################################
"# comment highlighting. json with comment support #
"###################################################

augroup filetype_json
    autocmd!
    autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" YCM
" The best part.

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>
nnoremap <silent> <Leader>gf :YcmCompleter FixIt<CR>

"##################################################
"# Settings specific for file types               #
"##################################################




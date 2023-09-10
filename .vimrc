call plug#begin()
Plug 'sirver/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'lervag/vimtex'
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

Plug 'KeitaNakamura/tex-conceal.vim'
set conceallevel=1
let g:tex_conceal='abdmg'
hi Conceal ctermbg=none

setlocal spell
set spelllang=en_us
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

execute pathogen#infect()

"Intuitive navigation through wrapped lines
nnoremap <Down> gj
nnoremap <Up> gk
vnoremap <Down> gj
vnoremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk
"Automatic close brace on enter
inoremap {<CR> {<CR>}<Esc>O
"Automatic closing parenthesis
inoremap ( ()<Left>
"Skip over closing parenthesis/brace
inoremap <expr> ) getline('.')[col('.') - 1] == ")" ? "\<Right>" : ")"
"Inkscape setup
inoremap <C-f> <Esc>: silent exec '.!inkscape-figures create "'.getline('.').'" "'.b:vimtex.root.'/figures/"'<CR><CR>:w<CR>
nnoremap <C-f> : silent exec '!inkscape-figures edit "'.b:vimtex.root.'/figures/" > /dev/null 2>&1 &'<CR><CR>:redraw!<CR>

set clipboard=unnamed
set autoindent    "Automatic indentation
set incsearch     "Jump to next match while searching
set hlsearch      "Highlight all occurrences on search
set scrolloff=10  "Buffer around cursor
set tabstop=4     "Show existing tab with 4 spaces width
set shiftwidth=4  "When indenting with '>', use 4 spaces width
set expandtab     "On pressing tab, insert 4 spaces
set softtabstop=4 "Number of columns for a TAB
set number        "Show line numbers

set termguicolors "Only needed in terminals
set bg=dark
colorscheme gruvbox

set t_Co=256
"highlight Comment guifg=#0070a8
highlight Search guifg=#6998b3

au BufNewFile,BufRead *.tex
    \ setlocal noautoindent

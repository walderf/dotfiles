""""" neovim - init.vim

""" plugins (vim-plug)
call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
" tabular and vim-markdown work in tangent
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
call plug#end()

""" individual plugin configuration

"" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

"" airline theme
let g:airline_theme='distinguished'

"" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"" gruvbox theme
let g:grubox_italic=1

"" utilsnips 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" split window for :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

""" general settings

" syntax highlighting
syntax enable
filetype indent plugin on

" enable mouse
set mouse=a

set ignorecase
set smartcase
set ruler
set number
" number of spaces for <tab>
set tabstop=2

" theme
colorscheme gruvbox

" colors
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" filetypes or something 
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown



" 


""""" neovim - init.vim

" requires plug.vim from https://github.com/junegunn/vim-plug
" must run :PlugInstall upon initial load

""" plugins (vim-plug)
call plug#begin('~/.vim/plugged')
Plug 'ellisonleao/glow.nvim', {'branch': 'main'}
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'preservim/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
"Plug 'scrooloose/syntastic'
Plug 'dense-analysis/ale'
Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
Plug 'kamykn/spelunker.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'kamykn/popup-menu.nvim'
" tabular and vim-markdown work in tangent
"Plug 'godlygeek/tabular'
"Plug 'plasticboy/vim-markdown'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'
call plug#end()

""" individual plugin configuration

"" airline
let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1

"" airline theme
let g:airline_theme='distinguished'

""" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"" ctrlp
let g:ctrlp_map = '<C-A-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

"let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
"let g:ctrlp_custom_ignore = {
"	\ 'dir':  '\v[\/]\.(git|hg|svn)$',
"	\ 'file': '\v\.(exe|so|dll)$',
"	\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
"	\ }

let g:ctrlp_user_command = 'find %s -type f'        " MacOSX/Linux

"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']
"let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
"let g:ctrlp_user_command = ['.hg', 'hg --cwd %s locate -I .']


"" ALE
" Fix files with prettier, and then ESLint.
"let b:ale_fixers = ['prettier', 'eslint']
let b:ale_fixers = ['remove_trailing_lines', 'trim_whitespace']
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 0
" Enable completion where available. 
let g:ale_completion_enabled = 0
" omni-completion function for triggering completion w/ <C-x><C-o>.
set omnifunc=ale#completion#OmniFunc
" Only run linters named in ale_linters settings.
let g:ale_linters_explicit = 0
" automatic imports from external modules, enabled by default 
let g:ale_completion_autoimport = 1
" Set this in your vimrc file to disabling highlighting
let g:ale_set_highlights = 1
" if using a color scheme which produces ugly highlights
"highlight ALEWarning ctermbg=DarkMagenta
" Set this. Airline will handle the rest.
let g:airline#extensions#ale#enabled = 1
" keybinds - map the keys Ctrl+j and Ctrl+k to moving between errors
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" Show 5 lines of errors (default: 10)
let g:ale_list_window_size = 7

" ctrlp ext
let g:ctrlp_extensions = get(g:, 'ctrlp_extensions', [])
      \ + ['spelunker']


"" spelunker
let g:enable_spelunker_vim = 1
let g:enable_spelunker_vim_on_readonly = 0
let g:spelunker_target_min_char_len = 4
let g:spelunker_max_suggest_words = 15
let g:spelunker_max_hi_words_each_buf = 100
" spellchecker type [1=opening/saving; 2=constant]
let g:spelunker_check_type = 1
let g:spelunker_highlight_type = 1
let g:spelunker_disable_uri_checking = 0
let g:spelunker_disable_email_checking = 0
let g:spelunker_disable_account_name_checking = 0
let g:spelunker_disable_acronym_checking = 0
let g:spelunker_disable_backquoted_checking = 0
let g:spelunker_disable_auto_group = 0


let g:spelunker_spell_bad_group = 'SpelunkerSpellBad'
let g:spelunker_complex_or_compound_word_group = 'SpelunkerComplexOrCompoundWord'
highlight SpelunkerSpellBad cterm=underline ctermfg=247 gui=underline guifg=#f9f9f9
highlight SpelunkerComplexOrCompoundWord cterm=underline ctermfg=247 gui=underline guifg=#9e9e9e

"" fix cursor hold
let g:cursorhold_updatetime = 100

"" gruvbox theme
let g:gruvbox_italic=1

"" utilsnips 
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" split window for :UltiSnipsEdit
let g:UltiSnipsEditSplit="vertical"

"" glow
let g:glow_border="shadow"
let g:glow_user_pager = v:true
let g:glow_style = "dark"
noremap <leader>p :Glow<CR>
       
""markdown preview
let g:mkdp_auto_start=0
let g:mkdp_auto_close=0
let g:mkdp_refresh_slow=0
let g:mkdp_command_for_global=0
let g:mkdp_open_to_the_world=0
let g:mkdp_browser='firefox'
let g:mkdp_echo_preview_url=1
let g:mkdp_port = '6981'
let g:mkdp_page_title = '「${name}」'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_preview_options = {
    \ 'mkit': {},
    \ 'katex': {},
    \ 'uml': {},
    \ 'maid': {},
    \ 'disable_sync_scroll': 0,
    \ 'sync_scroll_type': 'middle',
    \ 'hide_yaml_meta': 1,
    \ 'sequence_diagrams': {},
    \ 'flowchart_diagrams': {},
    \ 'content_editable': v:false,
    \ 'disable_filename': 0
    \ }
" toggle the browser preview with \m
map <leader>m :MarkdownPreviewToggle<CR>

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
" number of spaces for \t
set tabstop=2
set shiftwidth=2
set expandtab
set smartindent

" backup
set backup
set writebackup
set backupdir=~/.config/nvim/.backup,/tmp/.nvimbackup
set backupcopy=auto
:au BufWritePre * let &bex = '-' .. strftime("%Y%b%d%X") .. '~'

" theme
colorscheme gruvbox

" spell
set nospell
"set spelllang=en_us
"set spellsuggest=best,7

" colors
set background=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

" filetypes or something 
au BufNewFile,BufFilePre,BufRead *.md set filetype=markdown
 
"" keybindings

" Clear screen clears search highlighting. 
nnoremap <C-L> :nohl<CR><C-L>

" use Ctrl-s to save changes in insert or normal mode
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" use Ctrl-u to undo while in insert or normal mode
inoremap <C-u> <ESC>ui
nnoremap <C-u> u

" use Ctrl-q or Shift-q to exit the frigging show 
inoremap <C-q> <ESC>:q<CR>
nnoremap <C-q> :q<CR>

" copy / paste
nnoremap <C-c> "+yy
vnoremap <C-c> "+y
nnoremap <C-p> "+gp

" search / replace
nnoremap <leader>s :%s/

" terminal
tnoremap <Esc> <C-\><C-n>

" tabs
map <leader>t :tabnew<CR>
map <leader>q :tabclose<CR>
map <leader>- :-tabnext<CR>
map <leader>= :tabnext<CR>

" reload conf file
map <leader>r :source $MYVIMRC<CR>



" 


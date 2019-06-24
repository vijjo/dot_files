set nocompatible
let mapleader =" "
let maplocalleader = " "

" Enable plugin if has("autocmd")
if has("autocmd")
    autocmd! BufWritePost .vimrc source $MYVIMRC
endif

filetype plugin indent on
" Set shell directory
" set shell=/usr/local/bin/bash\ -i

" Set how many lines of command history VIM has to remember
set history=500

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Vim polyglot - language pack for Vim
"Plug 'sheerun/vim-polyglot'

Plug 'junegunn/goyo.vim'            " Distraction-free writing in Vim
Plug 'scrooloose/nerdtree'          " NerdTree

" Emmet - Text Expansion
" Plug 'mattn/emmet-vim'
" Plug 'rstacruz/sparkup' |
" Plug 'alvan/vim-closetag' |

Plug 'terryma/vim-multiple-cursors' " Multiple cursors

Plug 'ap/vim-css-color'             " CSS color
Plug 'prettier/vim-prettier'        " Plug 'Chiel92/vim-autoformat'

" Plug '/adelarsq/vim-matchit'        " Vim-Matchit html
Plug 'tpope/vim-surround'           " Change surrounding tag
Plug 'Raimondi/delimitMate'         " Insert/delete delimit in pair.
Plug 'tpope/vim-repeat'             " Additional support for vim
Plug 'tpope/vim-unimpaired'         " Vim unimpaired

Plug 'tomtom/tcomment_vim'          " Universal Comment
Plug 'godlygeek/tabular'            " Tabular

Plug 'greyblake/vim-preview'        " Preview markup files

Plug 'hdima/python-syntax'          " python syntax lightlighting
Plug 'vim-scripts/indentpython.vim' " python indentation


Plug 'vim-syntastic/syntastic'      " check syntax on each save
Plug 'bitc/vim-bad-whitespace'      " bad whitespace
""""""Command"""""""""
" EraseBadWhiteSpace
" ShowBadWhiteSpace
" HideBadWhiteSpace
" ToogleBadWhiteSpace
"""""""""""""""""""""""

Plug 'Valloric/YouCompleteMe'       " Auto-Complete
Plug 'plytophogy/vim-virtualenv'    " Virtual environment for vim

" Snippets in vim
Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'

Plug 'christoomey/vim-tmux-navigator' " Vim-tmux navigator
" Plug 'easymotion/vim-easymotion'    " Simpler way to use motions in vim
Plug 'vim-airline/vim-airline'      " Airline
Plug 'vim-airline/vim-airline-themes'

Plug 'dikiaap/minimalist'               " Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'jonathanfilip/vim-lucius'
Plug 'jnurmine/Zenburn'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'nelstrom/vim-mac-classic-theme'

" Initialize plugin system
call plug#end()"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turning on the syntax highlighting:
syntax enable

set encoding=utf-8              " Encoding with utf-8

" Enable python syntax highlight
syntax on

" Setting the color scheme for vim:
" set t_Co=256
set background=dark
let g:PaperColor_Theme_Options = {
            \   'theme': {
            \     'default.dark': {
            \       'transparent_background': 1
            \     }
            \   }
            \ }
colorscheme PaperColor
" let g:solarized_termcolors=256
let g:airline_theme='simple'
set cmdheight=2

" timeoutlen for mapping delays; ttimoutlen for key code delays
set timeoutlen=1000 ttimeoutlen=50

" Backspace deletes like most programs in insert mode
set backspace=indent,eol,start
" Toggle invisible characters


if has('gui_running')
    set background=dark
    let g:PaperColor_Theme_Options = {
                \   'theme': {
                \     'default.dark': {
                \       'transparent_background': 0
                \     }
                \   }
                \ }
    colorscheme PaperColor
    set guifont=Hack:h12
    set linespace=2
    " Disable blinking, and set block cursor for normal and insert mode
    set guicursor=n-v-c:blockCursor/lCursor
    set guicursor=i-ci:blockCursor/lCursor
    set guicursor=r-cr:blockCursor/lCursor
    set guicursor+=a:blinkon
    " Set the screen
    set guioptions-=r         " remove the righ-hand scroll bar
    set lines=58 columns=103   " screen size
endif

set nu rnu              " Enable line number and relative line number


augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

" enable line numbers
let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
augroup nerdtree
    autocmd!
    autocmd FileType nerdtree setlocal relativenumber
augroup END

set ruler               " Display the current position

" Highlight the current line
"set cursorline
" A status line with be used to separate windows
set laststatus=2        " Always display the status line

" Set the minimum screen lines above and below the cursor
set scrolloff=2
set wildmenu               " Turn on the wild menu

" Highlight variables
"autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))

" Smarter search options
set ignorecase
set smartcase
set incsearch
set hlsearch

" Softtabs,  spaces
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set shiftround  " Use multiple of shiftwidth when indenting

" Indent rules
" set cindent

" Matching bracket
set showmatch
set matchtime=1
" set matchpairs+=<:>

" Make it obvious where 80 characters is
set textwidth=79
set colorcolumn=+1

" Where the splits should occur
set splitbelow
set splitright

" Wrap line without breaking words
set wrap
set linebreak
set nolist  " list disables linebreak
set wrapmargin=0

"set formatoptions+=a
set formatoptions=cql

" Display incomplete commands
set showcmd

" Set a map leader to do extra key combinations
" like <leader>w saves the current file
set listchars=tab:‣\ ,eol:¬

" Text-to-speech the highlighted text
vnoremap <leader>y "xy:silent w !say "<c-r>x"<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change easymotion plugin prefix
" map <leader> <Plug>(easymotion-prefix)


" Syntastic Options
" set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_pylint_quiet_messages = { "level" : "warnings" }
let g:syntastic_python_checkers=['flake8']
" let g:syntastic_python_pylint_exe = 'pylint'
let g:syntastic_python_flake8_post_args="--ignore=E401,E501,F401"

let b:delimitMate_matchpairs = "(:),[:],{:}"

" vimscript definition
" autocmd BufNewFile,BufRead *.{vim,vimrc} set filetype=vim

augroup insertNew
    autocmd!
    autocmd BufNewFile * startinsert
augroup END

" PEP 8 indentation for Python
augroup python
    autocmd!
    " autocmd BufNewFile *.py startinsert
    autocmd FileType python
                \ setlocal tabstop=4 |
                \ setlocal softtabstop=4 |
                \ setlocal shiftwidth=4 |
                \ setlocal textwidth=79 |
                \ setlocal formatoptions=cql |
                \ setlocal expandtab |
                \ setlocal autoindent |
                \ setlocal fileformat=unix |
                \ let b:delimitMate_quotes = "\" '" |
                \ let b:delimitMate_nesting_quotes = ['"', "'"] |
                \ let python_hightlight_all = 1 |
    " autocmd FileWritePre normal :EraseBadWhiteSpace<cr>
augroup END

" Indentation for web development
augroup webDevelopment
    autocmd!
    autocmd BufNewFile,BufRead \*.{js,html,css}
                \ setlocal tabstop=2 |
                \ setlocal softtabstop=2 |
                \ setlocal shiftwidth=2 |
                \ setlocal nowrap |
    " when running at every change you may want to disable quickfix
    " let g:prettier#quickfix_enabled = 0
    " Running prettier before saving sync
    let g:prettier#autoformat = 0
    autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync
    " markdown file definition
    autocmd BufNewFile,BufRead *.{md.mdwn,mkd,mkdn,mark\*} set filetype=markdown
augroup END

augroup markdown
    autocmd!
    autocmd FileType markdown
                \ :onoremap ih :<c-u>execute "normal! ?^==\\+$\r:noh\rkvg_"<cr>
                \ :onoremap ah :<c-u>execute "normal! ?^==\\+$\r:noh\rg_vk0"<cr>
augroup END

" Close auto-complete window when finished
let g:ycm_autoclose_preview_window_after_completion=1
" Shortcut for goto definition
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
" Virtualenv support
let g:ycm_python_binayr_path = 'python'

" Configuration for ultiSnip
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="horizontal"
let g:UltiSnipsSnippetsDir="~/.vim/plugged/ultisnips/UltiSnips"
nnoremap <leader>s :UltiSnipsEdit<cr>
nnoremap <leader>as :split ~/.vim/plugged/ultisnips/UltiSnips/all.snippets<cr>
augroup snippets
    autocmd!
    autocmd BufLeave *.snippets
                \ :update |
                \ :call UltiSnips#RefreshSnippets() |
augroup END


" let g:user_enmet_install_global = 0
" autocmd FileType html,css EmmetInstall
" let g:user_emmet_leader_key='<c-e>'

let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" Distraction free mode
nnoremap <silent> yz :Goyo<cr>
let g:goyo_width = 80
let g:goyo_height = 100

" Turn on/off <C-t<C-t>
" Open NERDTree with Ctrl-N
noremap <silent> <leader>e :NERDTreeToggle<CR>

let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<leader>m'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<C-m>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

inoremap <c-x> <del>

" Move cursor in insert mode
" inoremap <c-h> <left>
inoremap <c-l> <right>
" inoremap <c-k> <up>
" inoremap <c-j> <down>


" Delete by <ctrl-d> in insert mode
" inoremap <c-d> <bs>
" Uppercase the typed word in insert mode
inoremap <c-u> <esc>viwUea
" Go to the end of line in insert mode
inoremap <c-e> <esc>A
" Uppercase a word in normal mode
nnoremap <leader>u viwUe

" Fast saving
nnoremap <leader>` :q!<cr>
nnoremap <leader>w :w!<cr>
nnoremap <leader>x :x<cr>
nnoremap <leader>q :q<cr>
nnoremap <c-s> :update<cr>
vnoremap <c-s> <esc>:update<cr>gv
inoremap <c-s> <esc>:update<cr>a

" Disable highlight when <leader><cr> is pressed
" nnoremap <silent> <leader><cr> :noh<cr>
" Look up word under cursor
nnoremap <silent> <Leader>d :!open -g dict://<cword><CR><CR>

" Join the line above the current line
nnoremap K kJ

" Break the line
nnoremap [z i<cr><esc>
nnoremap ]z i<cr>

" Quick edit vimrc file and shortcuts
nnoremap <leader>v :split $MYVIMRC<cr>
nnoremap <leader>r :so $MYVIMRC<bar>update<bar>e<cr>

" Run script from vim
augroup runScript
    autocmd!
    autocmd FileType python
                \ nnoremap <buffer> yr :update<bar>!clear;python3 %<CR>
    autocmd FileType sh
                \ nnoremap <buffer> yr :update<bar>!bash %<CR>
    autocmd FileType html
                \ nnoremap <buffer> yr :update<bar>!open %<CR>
augroup END

" Abbreviation

augroup filetype_html
    autocmd!
    autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END

nnoremap <leader>ac :Tabularize /#<cr>
vnoremap <leader>ac :Tabularize /#<cr>
vnoremap // y/<c-r>"<cr>

" Motion mapping
onoremap in( :<c-u>normal! f(vi(<cr>

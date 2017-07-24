"------------------------------------------------------------------------------
" VIM setting
" Ding-Jie Huang
" Last update: 2017/07/24
"------------------------------------------------------------------------------


"------------------------------------------------------------------------------
" vundle setting.
"------------------------------------------------------------------------------

set nocompatible              " be iMproved
filetype off                  " required!

"Install Vundle Automatically
let iCanHazVundle=1
let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
if !filereadable(vundle_readme)
  echo "Installing Vundle.."
  echo ""
  silent !mkdir -p ~/.vim/bundle
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let iCanHazVundle=0
endif

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Vundle management
Bundle 'gmarik/vundle'

" :: Basic editing or moving
Bundle 'Lokaltog/vim-easymotion'
Bundle 'YankRing.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'ervandew/supertab'

" :: Decorator
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
"Bundle 'Yggdroot/indentLine'
Bundle 'fholgado/minibufexpl.vim'

" :: Coding
Bundle 'scrooloose/nerdcommenter'
"Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'
Bundle 'SirVer/ultisnips'
Bundle 'honza/vim-snippets'
"Plugin 'joonty/vdebug'

" :: Language support
Bundle 'scrooloose/syntastic'
Bundle 'klen/python-mode'

"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
set bg=dark
set nu
set cursorline
filetype on 
filetype plugin on    " Enable filetype-specific plugins
set tabstop=4
set shiftwidth=4
set hlsearch
syntax on
set t_Co=256 		  " 256 color mode for airline
set fencs=utf-8,big5

command! W :execute ':silent w !sudo tee % > /dev/null' | :edit! 			"For write with root privilege

"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------


" --- NERDTree
" toggle NERDTree with F10
nnoremap <silent> <F10> :NERDTreeToggle<CR>

" --- NERDTree tabs
"let g:nerdtree_tabs_open_on_console_startup=1   


" --- MiniBufExpl
" Open MiniBufExpl with Ctrl-e
map <C-e> :MBEToggle<CR>

" --- Syntastic
let g:syntastic_check_on_open=1
let g:syntastic_enable_signs=1
"let g:syntastic_c_check_header = 0
"let g:syntastic_c_no_include_search = 1
"let b:syntastic_c_cflags = ' -I./'
"let g:syntastic_c_include_dirs = ['./src', '/home/hdj/standalone_libmodbus/test2']
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_remove_include_errors = 1
"set error or warning signs
let g:syntastic_error_symbol = 'X'
let g:syntastic_warning_symbol = 'O'

" --- TagBar
" toggle TagBar with f7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1

" --- EasyMotion
 let g:EasyMotion_leader_key = ','

" --- YouCompleteMe
"let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<TAB>']
"let g:ycm_key_list_previous_completion=['<S-TAB>']
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
"nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

" --- Ultisnips
"let g:UltiSnipsExpandTrigger="<C-l>"
"let g:UltiSnipsListSnippets="<c-s-tab>"
"let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"



" --- Airline
"let g:airline_powerline_fonts = 1
"let g:airline_theme= 'ubaryd'
"let g:airline_theme= 'bubblegum'
"let g:airline_theme= 'powerlineish'
"let g:airline_theme= 'sol'
"let g:airline_theme= 'base16'
"set guifont=Liberation\ Mono\ for\ Powerline\ 10 
"let g:Powerline_symbols = 'fancy'
"if !exists('g:airline_symbols')
  "let g:airline_symbols = {}
"endif
"let g:airline_symbols.space = "\ua0"

"let g:airline_left_sep = ''

"set ambiwidth=double

" --- indentLine
"let g:indentLine_color_term = 239
"let g:indentLine_color_gui = '#09AA08'
"let g:indentLine_char = '¦'

" --- Python-mode
let g:pymode_doc = 1
let g:pymode_rope = 1
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"


" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

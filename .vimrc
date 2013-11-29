"------------------------------------------------------------------------------
" VIM setting
" Ding-Jie Huang
" Last update: 2013/12/03
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


" :: Decorator
Bundle 'scrooloose/nerdtree'
Bundle 'jistr/vim-nerdtree-tabs'

" :: Coding
Bundle 'scrooloose/nerdcommenter'
Bundle 'Valloric/YouCompleteMe'
Bundle 'majutsushi/tagbar'

" :: Language support
Bundle 'scrooloose/syntastic'

"---------------------------------------------------------------------------
" General Settings
"---------------------------------------------------------------------------
" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc
set bg=dark
set nu
set cursorline
filetype on 

"---------------------------------------------------------------------------
" PLUGIN SETTINGS
"---------------------------------------------------------------------------


" --- NERDTree
" toggle NERDTree with F10
nnoremap <silent> <F10> :NERDTreeToggle<CR>

" --- NERDTree tabs
"let g:nerdtree_tabs_open_on_console_startup=1   

" --- YouCompleteMe
let g:ycm_confirm_extra_conf = 0
"let g:ycm_key_list_select_completion = ['<TAB>']
"let g:ycm_key_list_previous_completion=['<S-TAB>']
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


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
" toggle TagBar with F7
nnoremap <silent> <F7> :TagbarToggle<CR>
" set focus to TagBar when opening it
let g:tagbar_autofocus = 1
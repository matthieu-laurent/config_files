set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin)
Plugin 'tmhedberg/SimpylFold'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-syntastic/syntastic'
Plugin 'nvie/vim-flake8'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'majutsushi/tagbar'
"Plugin 'universal-ctags/ctags'
" ...

" hide .pyc files
let NERDTreeIgnore=['\.pyc$', '\~$']
autocmd vimenter * NERDTree
map <F9> :NERDTreeToggle<CR>

" Color scheme
if has('gui_running')
  set background=dark
  colorscheme solarized
else
  "colorscheme zenburn
endif
"call togglebg#map("<F5>")

" Enable folding
set foldmethod=indent
set foldlevel=99
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Tagbar
map <F8> :TagbarToggle<CR>

" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1
map <F5> :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_python_binary_path = '/usr/bin/python3'

" UTF8 support
set encoding=utf-8

" Syntastic settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let python_highlight_all=1
syntax on
set nu


" PEP8 indentation
au BufNewFile,BufRead *.py;
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix

au BufNewFile,BufRead *.js, *.html, *.css;
	\ set tabstop=2 |
	\ set softtabstop=2 |
	\ set shiftwidth=2

au BufRead,BufNewFile *.py, *.pyw, *.c, *.h match BadWhitespace /\s\+$/


" Virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  exec(compile(open(activate_this, "rb").read(), activate_this, 'exec'), dict(__file__=activate_this))
EOF

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set nocompatible

set backspace=indent,eol,start

set nobackup	
set nowritebackup
set history=50	
set ruler	
set showcmd	
set incsearch	

if has('mouse')
  set mouse=a
endif

" UI
if &term == 'xterm' || &term == 'screen'
  syntax on
  set t_Co=256
  let g:solarized_termcolors=256
  let g:solarized_termtrans = 1
  let g:solarized_contrast="high"
  set background=dark
  colorscheme solarized
 endif

set hlsearch
set cursorline
set autoindent
set smartindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set shiftround
set copyindent
set preserveindent
set number
set vb t_vb=
set noeb vb t_vb=

filetype plugin indent on

autocmd VimEnter * NERDTree
autocmd VimEnter * wincmd p

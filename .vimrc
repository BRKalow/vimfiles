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

if has('clipboard') && LINUX()
    set clipboard=unnamed
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

"This unsets the "last search pattern" register by hetting return
nnoremap <CR> :noh<CR><CR>

" Autocomplete already-existing words in the file with tab (extremely useful!)
"function InsertTabWrapper()
"    let col = col('.') - 1
"        if !col || getline('.')[col - 1] !~ '\k'
"            return "\<tab>"
"        else
"            return "\<c-p>"
"        endif
"endfunction

"inoremap <tab> <c-r>=InsertTabWrapper()<cr>

"Omnicompletion
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
        \if &omnifunc == "" |
        \setlocal omnifunc=syntaxcomplete#Complete |
        \endif
endif

hi Pmenu ctermfg=black ctermbg=lightgray
hi PmenuSbar ctermfg=darkcyan ctermbg=lightgray
hi PmenuThumb ctermfg=lightgray ctermbg=darkgray

au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menu,longest

"neocomplcache
let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_max_list = 15
let g:neocomplcache_force_overwrite_completefunc = 1

if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns._ = '\h\w*'

imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)

imap <silent><expr><C-k> neosnippet#expandable() ?
    \ "\<Plug>(neosnippet_expand_or_jump)" : (pumvisible() ?
    \ "\<C-e> : "\<Plug>(neosnippet_expand_or_jump)")
smap <TAB> <Right><Plug>(neosnippet_jump_or_expand)

inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#complete_common_string()

inoremap <expr><s-CR> pumvisible() ? neocomplcache#close_popup()"\<CR>" : "\<CR>"
inoremap <expr><CR> pumvisible() ? neocomplcache#close_popup() : "\<CR>"

inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplcache#close_popup()

inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
    let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
let g:neocomplcache_omni_patterns.cpp = '[^.[:digit:] *\t]\%\(\.\|->\)\|\h\w*::'
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\h\w*\|\h\w*::'


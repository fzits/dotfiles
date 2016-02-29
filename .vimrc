"vim:set ts=8 sts=2 sw=2 tw=0:
set nocompatible

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.

" scripts on GitHub repos
NeoBundle 'Shougo/vimproc.vim', {
\ 'build' : {
\     'windows' : 'tools\\update-dll-mingw',
\     'cygwin' : 'make -f make_cygwin.mak',
\     'mac' : 'make -f make_mac.mak',
\     'linux' : 'make',
\     'unix' : 'gmake',
\    },
\ }
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'Shougo/vimfiler.vim'
NeoBundle 'Shougo/vimshell.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neoyank.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'rgarver/Kwbd.vim'
NeoBundle 'othree/html5.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'gabrielelana/vim-markdown'
NeoBundle 'groenewege/vim-less'
"NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'mxw/vim-jsx'
NeoBundle 'inotom/str2htmlentity'
NeoBundle 'kannokanno/previm'
NeoBundle 'will133/vim-dirdiff'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'w0ng/vim-hybrid'

" scripts from http://vim-scripts.org/vim/scripts.html
NeoBundle 'surround.vim'
NeoBundle 'Align'
NeoBundle 'sudo.vim'
NeoBundle 'BufOnly.vim'
NeoBundle 'blackboard.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

syntax on

set enc=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,euc-cn,ucs-2le,ucs-2
set nofixeol
set number
set cursorline
set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set backspace=2
set wrapscan
set noshowmatch
set wildmenu
set formatoptions+=mM
set whichwrap=b,s,h,l,<,>,[,]
set list
set listchars=tab:>\ ,extends:<,trail:~
set wrap
set laststatus=2
set cmdheight=2
set showcmd
set title
set hlsearch
set incsearch
set ambiwidth=double
set display+=lastline
set autoread
set scrolloff=5
set directory=~/tmp,/var/tmp,/tmp
set backupdir=~/tmp,/var/tmp,/tmp
set visualbell t_vb=
set statusline=%F%m%r%h%w\%=[FT=%Y]\[FF=%{&ff}]\[FENC=%{&fileencoding}]
set formatoptions+=m
if has("X11")
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif
set noundofile

noremap j gj
noremap k gk
noremap tn :tabnew<CR>
nnoremap * *N
noremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
inoremap <C-tab> :tabnext<CR>
inoremap <C-S-tab> :tabprevious<CR>

" vimrcをリローダブルにする
nnoremap <Space>.   :<C-u>edit $MYVIMRC<CR>
nnoremap <Space>s.  :<C-u>source $MYVIMRC<CR>

" str2htmlentity
vmap <silent> sx :Str2HtmlEntity<cr>
vmap <silent> sr :Entity2HtmlString<cr>

" VimFiler
noremap <LEADER>ff :<C-u>VimFiler<CR>
noremap <LEADER>fc :<C-u>VimFilerCreate<CR>
noremap <LEADER>ft :<C-u>VimFilerTab<CR>
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_as_default_explorer = 1

" neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" <CR>: close popup and save indent.
" inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
" function! s:my_cr_function()
"   " return neocomplete#close_popup() . "\<CR>"
"   " For no inserting <CR> key.
"   " return pumvisible() ? neocomplete#close_popup() : "\<CR>"
" endfunction

" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" <CR>: completion.
inoremap <expr><CR>   pumvisible() ? "\<C-n>" . neocomplete#close_popup()  : "<CR>"

" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()


" Unite
let g:unite_enable_start_insert = 1
noremap <silent> ,f :<C-u>Unite -buffer-name=files -default-action=tabopen file_rec<CR>
noremap <silent> ,c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
noremap <silent> ,m :<C-u>Unite -buffer-name=files file_mru<CR>
noremap <silent> ,b :<C-u>Unite buffer -buffer-name=files<CR>
noremap <silent> ,g :<C-u>Unite grep<CR>
noremap <silent> ,h :<C-u>Unite history/yank<CR>
imap <C-k> <Plug>(neocomplcache_start_unite_complete)

" Previm
let g:previm_open_cmd = 'open -a Google\ Chrome'

augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

" Markdown
" スペルチェックOFF（日本語がスペルチェックにひっかかるため）
let g:markdown_enable_spell_checking = 0
" 略語の展開をOFF
let g:markdown_enable_input_abbreviations = 0

" JSX
" let g:jsx_ext_required = 0

" Color
set background=dark
colorscheme hybrid
highlight CursorLine cterm=none ctermbg=black
highlight SpecialKey term=underline ctermfg=236

"全角スペースのハイライト
function! IdeographicSpace()
    highlight IdeographicSpace ctermbg=red guibg=red
endfunction

if has('syntax')
    augroup IdeographicSpace
        autocmd!
        autocmd ColorScheme       * call IdeographicSpace()
        autocmd VimEnter,WinEnter * match IdeographicSpace /　/
    augroup END
    call IdeographicSpace()
endif

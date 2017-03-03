"vim:set ts=8 sts=2 sw=2 tw=0:
"
"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  call dein#add('Shougo/neocomplete.vim')
  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('mattn/emmet-vim')
  call dein#add('rgarver/Kwbd.vim')
  call dein#add('othree/html5.vim')
  call dein#add('nikvdp/ejs-syntax')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('gabrielelana/vim-markdown')
  call dein#add('groenewege/vim-less')
  call dein#add('fatih/vim-go')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('mxw/vim-jsx')
  call dein#add('inotom/str2htmlentity')
  call dein#add('kannokanno/previm')
  call dein#add('will133/vim-dirdiff')
  call dein#add('altercation/vim-colors-solarized')
  call dein#add('w0ng/vim-hybrid')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tpope/vim-surround')
  call dein#add('schickling/vim-bufonly')
  call dein#add('lisposter/vim-blackboard')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

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
"cmap <C-f> <Right>
"cmap <C-b> <Left>
"cnoremap <C-S-f> <C-f>

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
noremap <silent> ,f :<C-u>Unite -buffer-name=files -default-action=open file_rec<CR>
noremap <silent> ,c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
noremap <silent> ,m :<C-u>Unite -buffer-name=files file_mru<CR>
noremap <silent> ,b :<C-u>Unite buffer -buffer-name=files<CR>
noremap <silent> ,g :<C-u>Unite grep<CR>
noremap <silent> ,h :<C-u>Unite history/yank<CR>
imap <C-k> <Plug>(neocomplcache_start_unite_complete)


" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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

" Go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)
au FileType go nmap <Leader>ds <Plug>(go-def-split)
au FileType go nmap <Leader>dv <Plug>(go-def-vertical)
au FileType go nmap <Leader>dt <Plug>(go-def-tab)
au FileType go nmap <Leader>gd <Plug>(go-doc)
au FileType go nmap <Leader>gv <Plug>(go-doc-vertical)
au FileType go nmap <Leader>gb <Plug>(go-doc-browser)
au FileType go nmap <Leader>s <Plug>(go-implements)
au FileType go nmap <Leader>i <Plug>(go-info)
au FileType go nmap <Leader>e <Plug>(go-rename)

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

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

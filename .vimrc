"vim:set ts=8 sts=2 sw=2 tw=0:
"
"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=$HOME/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('$HOME/.cache/dein')
  call dein#begin('$HOME/.cache/dein')

  call dein#add('Shougo/vimfiler.vim')
  call dein#add('Shougo/vimshell.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/neoyank.vim')
  call dein#add('thinca/vim-quickrun')
  call dein#add('prabirshrestha/async.vim')
  call dein#add('prabirshrestha/vim-lsp')
  call dein#add('prabirshrestha/asyncomplete.vim')
  call dein#add('prabirshrestha/asyncomplete-lsp.vim')
  call dein#add('mattn/vim-lsp-settings')
  call dein#add('mattn/emmet-vim')
  call dein#add('w0rp/ale')
  call dein#add('rgarver/Kwbd.vim')
  call dein#add('othree/html5.vim')
  call dein#add('nikvdp/ejs-syntax')
  call dein#add('pangloss/vim-javascript')
  call dein#add('hail2u/vim-css3-syntax')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('inotom/str2htmlentity')
  call dein#add('will133/vim-dirdiff')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('tpope/vim-surround')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('schickling/vim-bufonly')
  call dein#add('haishanh/night-owl.vim')
  call dein#add('vim-jp/vimdoc-ja')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

syntax on

set helplang=ja
set enc=utf-8
set fileencodings=utf-8,iso-2022-jp,euc-jp,cp932,euc-cn,ucs-2le,ucs-2
set nofixeol
set number
set nocursorline
set ignorecase
set smartcase
set shortmess-=S
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
set cmdheight=1
set title
set hlsearch
set incsearch
set ambiwidth=double
set display+=lastline
set autoread
set scrolloff=5
set eadirection=hor
set foldmethod=manual
set directory=~/tmp,/var/tmp,/tmp
set backupdir=~/tmp,/var/tmp,/tmp
set visualbell t_vb=
"set statusline=%F%m%r%h%w\%=\[%{ALEGetStatusLine()}][FT=%Y]\[FF=%{&ff}]\[FENC=%{&fileencoding}]
set statusline=%F%m%r%h%w\%=\[FT=%Y]\[FF=%{&ff}]\[FENC=%{&fileencoding}]
set formatoptions+=m
if has("X11")
  set clipboard=unnamedplus,unnamed
else
  set clipboard+=unnamed
endif
set undodir=$HOME/.vim/undodir
set undofile
set splitbelow
set splitright
set hidden
set mouse=a
set ttymouse=xterm2

noremap j gj
noremap k gk
nnoremap * *N
noremap <C-w>n :tabnext<CR>
noremap <C-w>p :tabprevious<CR>
tnoremap <C-w>n <C-w>:tabnext<CR>
tnoremap <C-w>p <C-w>:tabprevious<CR>
noremap <C-tab> :tabnext<CR>
noremap <C-S-tab> :tabprevious<CR>
tnoremap <C-tab> <C-w>:tabnext<CR>
tnoremap <C-S-tab> <C-w>:tabprevious<CR>
cnoremap <C-f> <Right>
cnoremap <C-b> <Left>

" Vim-LSP
let g:lsp_diagnostics_enabled = 0
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? "\<C-y>" : "\<cr>"
" debug
" let g:lsp_log_verbose = 1
" let g:lsp_log_file = expand('~/vim-lsp.log')
" let g:asyncomplete_log_file = expand('~/asyncomplete.log')

" Terminal
noremap <LEADER>tt :terminal++rows=10<CR>
noremap <LEADER>tc :terminal++curwin<CR>
noremap <LEADER>tv :vnew<CR>:terminal++curwin<CR>
noremap <LEADER>tn :tabnew<CR>:terminal++curwin<CR>
noremap <LEADER>tig :tabnew<CR>:call term_start(['tig'], {'curwin': v:true, 'term_finish': 'close'})<CR>

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

" Unite
let g:unite_enable_start_insert = 1

noremap <silent> ,f :<C-u>Unite -buffer-name=files -default-action=open file_rec<CR>
noremap <silent> ,c :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
noremap <silent> ,m :<C-u>Unite -buffer-name=files file_mru<CR>
noremap <silent> ,b :<C-u>Unite buffer -buffer-name=files<CR>
noremap <silent> ,g :<C-u>Unite grep<CR>
noremap <silent> ,h :<C-u>Unite history/yank<CR>
imap <C-k> <Plug>(neocomplcache_start_unite_complete)

call unite#custom_source('file,file_rec,file_rec/async,grep',
      \ 'ignore_pattern', join([
      \ '\.git/',
      \ 'node_modules/',
      \ ], '\|'))

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" ALE
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_statusline_format = ['E:%d', 'W:%d', 'OK']

let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'

let g:ale_sign_column_always = 1

let g:ale_linters = {
            \    'html': ['htmlhint'],
            \    'javascript': ['eslint']
            \}

let g:ale_linter_aliases = {
            \'xhtml': 'html'
            \}

" Markdown
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_folding_disabled = 1

"ColorScheme
if (has("termguicolors"))
 set termguicolors
endif
set background=dark

"Night Owl 【注意】 ターミナルをイタリックに対応させないと
"コメント等の cterm=italic が設定されている箇所に背景色が表示されてしまう
"イタリック対応方法
"https://weibeld.net/terminals-and-shells/italics.html
colorscheme night-owl

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

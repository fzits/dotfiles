" vim:set ts=8 sts=2 sw=2 tw=0

"colorscheme blackboard
colorscheme desert
"set background=dark
"set background=light
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
"colorscheme solarized

highlight SpecialKey term=underline ctermfg=darkgray guifg=#505050
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /s+$/
au BufNewFile,BufRead * match ZenkakuSpace /　/

" IMEの状態でカーソルの色を変える
if has('multi_byte_ime')
  highlight CursorIM guifg=NONE guibg=Purple
endif

set guioptions-=m
set guioptions-=T

if has('gui_macvim')
  set showtabline=2
  set imdisable

  set guifont=SourceCodePro-Regular:h14
  set guifontwide=SourceHanSans-Regular:h14
  "set guifont=Osaka-mono:h12
  "set guifontwide=Osaka-mono:h12
  set guicursor=a:blinkon0
  set antialias
  set columns=240
  set lines=72
  set linespace=1

endif

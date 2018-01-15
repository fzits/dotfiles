" vim:set ts=8 sts=2 sw=2 tw=0

set background=dark
colorscheme hybrid
set transparency=1

set guioptions-=m
set guioptions-=T

if has('gui_macvim')
  set showtabline=2
  set imdisable

  set guifont=SourceCodePro-Regular:h14
  set guifontwide=SourceHanSans-Regular:h14
  set guicursor=a:blinkon0
  set antialias
  set columns=180
  set lines=70
  set linespace=1

endif

" vim:set ts=8 sts=2 sw=2 tw=0

colorscheme desert
highlight SpecialKey guifg=#505050

set guioptions-=m
set guioptions-=T

if has('gui_macvim')
  set showtabline=2
  set imdisable

  set guifont=SourceCodePro-Regular:h14
  set guifontwide=SourceHanSans-Regular:h14
  set guicursor=a:blinkon0
  set antialias
  set columns=240
  set lines=72
  set linespace=1

endif

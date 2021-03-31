if exists('g:loaded_popper')
	finish
endif

let g:loaded_popper = 1

let s:save_cpo = &cpo
set cpo&vim

command! Popper call popper#files()

let &cpo = s:save_cpo
unlet s:save_cpo

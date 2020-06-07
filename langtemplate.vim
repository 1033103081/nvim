func! Setupmarkdown()
	autocmd Filetype markdown inoremap <buffer> ,f <Esc>/<++><CR>:nohlsearch<CR>c4l
	autocmd Filetype markdown inoremap <buffer> ,w <Esc>/ <++><CR>:nohlsearch<CR>c5l<CR>
	autocmd Filetype markdown inoremap <buffer> ,n ---<Enter><Enter>
	autocmd Filetype markdown inoremap <buffer> ,b **** <++><Esc>F*hi
	autocmd Filetype markdown inoremap <buffer> ,s ~~~~ <++><Esc>F~hi
	autocmd Filetype markdown inoremap <buffer> ,i ** <++><Esc>F*i
	autocmd Filetype markdown inoremap <buffer> ,d `` <++><Esc>F`i
	autocmd Filetype markdown inoremap <buffer> ,c ```<Enter><++><Enter>```<Enter><Enter><++><Esc>4kA
	autocmd Filetype markdown inoremap <buffer> ,m - [ ] <Enter><++><ESC>kA
	autocmd Filetype markdown inoremap <buffer> ,p ![](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,a [](<++>) <++><Esc>F[a
	autocmd Filetype markdown inoremap <buffer> ,1 #<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,2 ##<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,3 ###<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,4 ####<Space><Enter><++><Esc>kA
	autocmd Filetype markdown inoremap <buffer> ,l --------<Enter>
endfunction


func! Setupshell()
	call append(0,"#!/usr/bin/env sh")
	call append(1,"")
endfunction


function! Setupmake()
	call append(0,"#!/usr/bin/env make")
	call append(1,"ccred=$(shell echo \"\\033[0;31m\")")
	call append(2,"ccgreen=$(shell echo \"\\033[0;32m\")")
	call append(3,"ccyellow=$(shell echo \"\\033[0;33m\")")
	call append(4,"ccwhite=$(shell echo \"\\033[0;37m\")")
	call append(5,"# $(error ${ccred} error message ${ccwhite})")
	call append(6,"# $(info ${ccyellow} info message ${ccwhite})")
	call append(7,"")
	call append(8,"")
	call append(9,"#check if file exists")
	call append(10,"#ifneq (\"$(wildcard  FILENAME)\",\"\")")
	call append(11,"##file exists; use space insted of tab here")
	call append(12,"#endif ")
	call append(13,"")
	call append(14,"use ${LINENO} to locate the error message location")


endfunction

autocmd BufNewFile *.sh call Setupshell()
autocmd BufNewFile Makefile call Setupmake()
autocmd Filetype markdown call Setupmarkdown()

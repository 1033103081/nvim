" Random Useful Functions

" Turn spellcheck on for markdown files
augroup auto_spellcheck
  autocmd BufNewFile,BufRead *.md setlocal spell
augroup END

nnoremap <f10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
	  \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
	  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<cr>

func! CompileRunGcc()
  exec "w"
  if &filetype == 'c'
	exec "!gcc % -lgtest -lbenchmark -pthread -o %<"
	exec "!timeout 30  ./%<"
  elseif &filetype == 'cpp'
	set splitbelow
	exec "!g++ -std=c++11 %  -lgtest -ljsoncpp -lbenchmark -lcrypto -pthread -Wall -o %<"
	exec "!timeout 30  ./%<"
  elseif &filetype == 'java'
	exec "!javac %"
	exec "!time java %<"
  elseif &filetype == 'sh'
	:!time bash %
  elseif &filetype == 'python'
	exec "!time python3 %"
  elseif &filetype == 'html'
	"silent! exec "!chromium % &"
	silent! exec "!/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome % "
  elseif &filetype == 'javascript'
	exec "!node %"
  elseif &filetype == 'typescript'
	exec "!node %"
  elseif &filetype == 'markdown'
	exec "MarkdownPreview"
  elseif &filetype == 'tex'
	silent! exec "!pdflatex %"
	silent! exec "!echo 'done'"
	"silent! exec "VimtexCompile"
  elseif &filetype == 'go'
	exec "!go run %"
  endif
endfunc



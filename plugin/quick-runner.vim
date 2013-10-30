func! Compile_and_run( str)
	cclose
	compiler gcc

	let l:file = globpath($rtp, "plugin/makefile")
	echo l:file
	make %:p:r -f l:file

	let errors = 0
	for msg in getqflist()
		if msg['type'] ==? 'E'
			let errors = 1
			break
		endif
	endfor

	if errors == 0
		if a:str != ""
			exec a:str
		endif
	else
		if g:quick_runner_auto_open_quickfix
			redraw
			botright cwindow
			.cc
		endif
	endif
endfunc

"Compile and run with input file
map <F9> : call Compile_and_run( "!%:p:r < %:p:r.in")<CR>
"Compile only
map <C-F6> : call Compile_and_run( "")<CR>
"Compile and run
map <F6> : call Compile_and_run( "!%:p:r")<CR>
"Compile and run with input and output file
map <F8> : call  Compile_and_run( "!%:p:r < %:p:r.in > %:p:r.out")<CR>

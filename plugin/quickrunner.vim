func! Compile_and_run( str)
	cclose
	compiler gcc

	exec "make %:p:r -f " + g:quickrunner_makefile_path

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
		if g:quickrunner_auto_open_quickfix
			redraw
			botright cwindow
			.cc
		endif
	endif
endfunc

if (!exists("g:quickrunner_makefile_path"))
	let g:quickrunner_makefile_path = expand("<sfile>:p:h") + "/makefile"
endif

if (!exists("g:quickrunner_auto_open_quickfix"))
	let g:quickrunner_auto_open_quickfix = 1
endif

if (!exists("g:quickrunner_inputfile_suffix"))
	let g:quickrunner_inputfile_suffix = ".in"
endif

if (!exists("g:quickrunner_outputfile_suffix"))
	let g:quickrunner_outputfile_suffix = ".out"
endif

if (!exists("g:quickrunner_no_mapping"))
	"Compile and run with input file
	map <F9> : call Compile_and_run( '!%:p:r' +
				\' < %:p:r' + g:quickrunner_inputfile_suffix")<CR>
	"Compile only
	map <C-F6> : call Compile_and_run( "")<CR>
	"Compile and run
	map <F6> : call Compile_and_run( "!%:p:r")<CR>
	"Compile and run with input and output file
	map <F8> : call  Compile_and_run( '!%:p:r' +
				\' < %:p:r' + g:quickrunner_inputfile_suffix +
				\' > %:p:r' + g:quickrunner_outputfile_suffix)<CR>
endif

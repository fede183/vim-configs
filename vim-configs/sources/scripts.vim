fu! GroffCompile()

	let file = expand('%:f')
	let filename = expand('%:r')
	let filetype = expand('%:e')

	if ! (filetype == 'ms')
		echoerr 'the file type is invalid, should be .ms'
		return
	endif
       		
       	execute '! tbl ' . file . ' | groff -ms -Tpdf | tee ' . filename . '.pdf >/dev/null'
	
	echom 'Groff compile succesfully'

endfunction

fu! GroffPreview()

	let filename = expand('%:r')
	let filetype = '.pdf'
	let file = filename . filetype

	silent execute '! zathura ' . file . ' &'
	
endfunction

fu! GroffModeOn()

	augroup groff
		au BufWritePost * if (expand('%:e') == 'ms') | execute GroffCompile() | endif
	augroup END

endfunction


command GroffCompile call GroffCompile()
command GroffPreview call GroffPreview()
command GroffModeOn call GroffModeOn()

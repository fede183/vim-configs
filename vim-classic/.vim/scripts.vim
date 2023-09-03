fu! GroffCompile()

	let file = expand('%:f')
	let filename = expand('%:r')
	let filetype = expand('%:e')

	if ! (filetype == 'ms')
		echoerr 'the file type is invalid, should be .ms'
		return
	endif
       		
       	execute '! groff -ms ' . file . ' -T pdf > ' . filename . '.pdf'
	
	echom 'Groff compile succesfully'

endfunction

fu! GroffPreview()

	let filename = expand('%:r')
	let filetype = '.pdf'
	let file = filename . filetype

	execute '! zathura ' . filename
	
endfunction

command GroffCompile call GroffCompile()
command GroffPreview call GroffPreview()


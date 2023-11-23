function GroffCompile()
	local file = vim.fn.expand('%:f')
	local filename = vim.fn.expand('%:r')
	local filetype = vim.fn.expand('%:e')

	if filetype ~= 'ms' then
		vim.api.nvim_err_writeln('the file type is invalid, should be .ms')
		return
	end

	local groff_command = string.format('! groff -ms %s -T pdf > %s.pdf', file, filename)
	vim.cmd(groff_command)
end

vim.api.nvim_create_user_command('GroffCompile', GroffCompile, {})

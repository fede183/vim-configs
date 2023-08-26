local api = vim.api

local filepath = vim.fn.expand('%:f')
local groff_command = string.format('! groff -ms %s -T pdf > %s.pdf', filepath, filepath)

api.nvim_create_user_command('GroffCompile', groff_command, {})
-- cmd.GroffProgram()

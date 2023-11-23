local vim_configs_path = '/home/federico/Projects/vim-configs'
local config_path = vim_configs_path + '/nvim-exclusive'
local install_script_path = vim_configs_path + '/install-nvim-config'
local current_file_absolutepath = vim.fn.expand('%:p')

local function starts_with(str, start)
   return str:sub(1, #start) == start
end

local function install_script_run()
	if starts_with(current_file_absolutepath, config_path) then
		vim.cmd(':!bash ' + install_script_path)
	end
end


vim.api.nvim_create_augroup("custom", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
	group = "custom",
	callback = install_script_run,
})

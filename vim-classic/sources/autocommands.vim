fu! StartsWith(longer, shorter) abort
	return a:longer[0:len(a:shorter)-1] ==# a:shorter
endfunction

let vim_configs_path = '/home/federico/Projects/vim-configs'
let config_path = vim_configs_path . '/vim-classic'
let install_script_path = vim_configs_path . '/install-vim-config'
let current_file_absolutepath = expand('%:p')

let config_path_for_vimb = vim_configs_path . '/vimb-configs'
let install_script_path_for_vimb = vim_configs_path . '/install-vimb-config'

augroup custom
	au BufWritePost * if StartsWith(current_file_absolutepath, config_path) | execute '! bash ' . install_script_path | endif
	au BufWritePost * if StartsWith(current_file_absolutepath, config_path_for_vimb) | execute '! bash ' . install_script_path_for_vimb | endif
augroup END

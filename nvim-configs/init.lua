require('plugins')
require('mappings')
require('scripts')
require('autocommands')
require('plugins_configs/treesitter-config')
require('plugins_configs/nvim-tree-config')
require('plugins_configs/mason-configs')
require('plugins_configs/rust-tools-configs')
require('plugins_configs/lsp-configs')
require('plugins_configs/cmp-configs')
require('plugins_configs/dap-config')

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.background = 'dark'

vim.cmd('syntax on')
vim.cmd('colorscheme gruvbox8')

vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

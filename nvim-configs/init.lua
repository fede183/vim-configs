require('plugins')
require('mappings')
require('treesitter-config')
require('nvim-tree-config')
require('scripts')
require('autocommands')
require('lspsetups')

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.background = 'dark'

vim.cmd('syntax on')
vim.cmd('colorscheme gruvbox8')

vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'

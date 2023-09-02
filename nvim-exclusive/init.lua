require('plugins')
require('mappings')
require('treesitter-config')
require('nvim-tree-config')
require('lsp-config')
require('scripts')

vim.opt.number = true
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.cmd('syntax on')

vim.cmd('colorscheme ron')

vim.opt.wildmenu = true
vim.opt.wildmode = 'list:longest'
vim.opt.wildignore = '*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx'



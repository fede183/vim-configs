require('plugins')
require('mappings')
require('treesitter-config')
require('nvim-tree-config')
require('lsp-config')
require('scripts.lua')

local set = vim.opt
local cmd = vim.cmd

set.number = true

cmd('syntax on')

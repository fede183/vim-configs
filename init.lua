require("plugins")
require("mappings")
require("treesitter-config")
require("nvim-tree-config")
require("lsp-config")

local set = vim.opt
local cmd = vim.cmd

set.number = true

cmd("syntax on")

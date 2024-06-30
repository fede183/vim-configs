local keymap = vim.keymap

vim.g.mapleader = " "

-- Search
local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- Tree
local api = require("nvim-tree.api")
keymap.set("n", "<leader>e", api.tree.toggle, {})
keymap.set("n", "<leader>E", api.tree.focus, {})

-- DAP
vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')

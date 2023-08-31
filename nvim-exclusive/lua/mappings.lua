local keymap = vim.keymap

vim.g.mapleader = " "

local builtin = require('telescope.builtin')
keymap.set('n', '<leader>ff', builtin.find_files, {})
keymap.set('n', '<leader>fg', builtin.live_grep, {})
keymap.set('n', '<leader>fb', builtin.buffers, {})
keymap.set('n', '<leader>fh', builtin.help_tags, {})

local api = require("nvim-tree.api")
keymap.set("n", "<leader>e", api.tree.toggle, {})
keymap.set("n", "<leader>o", api.tree.focus, {})

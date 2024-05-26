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
vim.keymap.set('n', '<F7>', function() require('dap').continue() end)
vim.keymap.set('n', '<F8>', function() require('dap').step_over() end)
vim.keymap.set('n', '<F6>', function() require('dap').step_into() end)
vim.keymap.set('n', '<F5>', function() require('dap').step_out() end)
vim.keymap.set('n', '<leader>b', function() require('dap').toggle_breakpoint() end)

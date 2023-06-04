vim.g.mapleader = " "

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>s", builtin.grep_string, {})

local api = require("nvim-tree.api")
vim.keymap.set("n", "<leader>e", api.tree.toggle, {})
vim.keymap.set("n", "<leader>o", api.tree.focus, {})

-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({

  { 'nvim-telescope/telescope.nvim', tag = '0.1.5', dependencies = { 'nvim-lua/plenary.nvim' }},

  'nvim-treesitter/nvim-treesitter',

  'nvim-tree/nvim-tree.lua',
  'nvim-tree/nvim-web-devicons',

  'lifepillar/vim-gruvbox8',
  'tpope/vim-commentary',
  'neovimhaskell/haskell-vim',
  'haskell/stylish-haskell',

  { 'saecki/crates.nvim', 
    tag = 'stable',
    config = function() 
	require('crates').setup()
    end,
  },

  {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},
  {'L3MON4D3/LuaSnip'},

})

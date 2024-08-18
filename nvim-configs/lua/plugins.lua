-- This file can be loaded by calling `lua require("plugins")` from your init.vim

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
	{
		"nvim-treesitter/nvim-treesitter",
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "ron", "rust", "toml" })
			end
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons",
	"lifepillar/vim-gruvbox8",
	"tpope/vim-commentary",
	-- Haskel
	"neovimhaskell/haskell-vim",
	"haskell/stylish-haskell",

	-- Rust
	{
		"Saecki/crates.nvim",
		event = { "BufRead Cargo.toml" },
		opts = {
			src = {
				cmp = { enabled = true },
			},
		},
	},
	
	-- Mason
	"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
  	
	-- LSP
	"neovim/nvim-lspconfig",
    	"simrat39/rust-tools.nvim",

	-- Completion framework:
	"hrsh7th/nvim-cmp",

	-- LSP completion source:
	"hrsh7th/cmp-nvim-lsp",

	-- Useful completion sources:
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",          
	"hrsh7th/cmp-path",                            
	"hrsh7th/cmp-buffer",                            
	"hrsh7th/vim-vsnip",
	"voldikss/vim-floaterm",

	-- Lua
	{"L3MON4D3/LuaSnip"},
})

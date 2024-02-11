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
	'neovimhaskell/haskell-vim',
	'haskell/stylish-haskell',

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

	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{
				"Saecki/crates.nvim",
				event = { "BufRead Cargo.toml" },
				opts = {
					src = {
						cmp = { enabled = true },
					},
				},
			},
		},
		---@param opts cmp.ConfigSchema
		opts = function(_, opts)
			opts.sources = opts.sources or {}
			table.insert(opts.sources, { name = "crates" })
		end,
	},
	{
		"simrat39/rust-tools.nvim",
		lazy = true,
		opts = function()
			local ok, mason_registry = pcall(require, "mason-registry")
			local adapter ---@type any
			if ok then
				-- rust tools configuration for debugging support
				local codelldb = mason_registry.get_package("codelldb")
				local extension_path = codelldb:get_install_path() .. "/extension/"
				local codelldb_path = extension_path .. "adapter/codelldb"
				local liblldb_path = ""
				if vim.loop.os_uname().sysname:find("Windows") then
					liblldb_path = extension_path .. "lldb\\bin\\liblldb.dll"
				elseif vim.fn.has("mac") == 1 then
					liblldb_path = extension_path .. "lldb/lib/liblldb.dylib"
				else
					liblldb_path = extension_path .. "lldb/lib/liblldb.so"
				end
				adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path)
			end
			return {
				dap = {
					adapter = adapter,
				},
				tools = {
					on_initialized = function()
						vim.cmd([[
			augroup RustLSP
			  autocmd CursorHold                      *.rs silent! lua vim.lsp.buf.document_highlight()
			  autocmd CursorMoved,InsertEnter         *.rs silent! lua vim.lsp.buf.clear_references()
			  autocmd BufEnter,CursorHold,InsertLeave *.rs silent! lua vim.lsp.codelens.refresh()
			augroup END
		      ]])
					end,
				},
			}
		end,
		config = function() end,
	},
	{
		"neovim/nvim-lspconfig",
	},
	{
		"rouge8/neotest-rust",
	},
	{
		"williamboman/mason.nvim",
		optional = true,
		opts = function(_, opts)
			if type(opts.ensure_installed) == "table" then
				vim.list_extend(opts.ensure_installed, { "codelldb" })
			end
		end,
	},
	{
		"nvim-neotest/neotest",
		optional = true,
		dependencies = {
			"rouge8/neotest-rust",
		},
		opts = {
			adapters = {
				["neotest-rust"] = {},
			},
		},
	},

	-- Lua
	{'L3MON4D3/LuaSnip'},
})

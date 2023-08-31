local lsp = require('lsp-zero').preset({})

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.ensure_installed({
  'lua_ls',
  'rust_analyzer'
})

lsp.setup_servers({'rust_analyzer', 'lua_ls'})

require'lspconfig'.lua_ls.setup{}

require'lspconfig'.rust_analyzer.setup{}

lsp.setup()

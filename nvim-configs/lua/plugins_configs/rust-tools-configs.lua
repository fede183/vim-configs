local rt = require("rust-tools")

rt.setup({
  server = {
    capabilities = require("cmp_nvim_lsp").default_capabilities(),
  },
  tools = {
    hover_actions = {
      auto_focus = true,
    },
  },
})

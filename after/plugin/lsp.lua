local lspconfig = require('lspconfig')

local capabilities = require('blink.cmp').get_lsp_capabilities()

lspconfig.lua_ls.setup {
  cmd = { "/home/linuxbrew/.linuxbrew/bin/lua-language-server" },
  capabilities = capabilities,
}

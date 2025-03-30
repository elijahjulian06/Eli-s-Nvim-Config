local lspconfig = require('lspconfig')


lspconfig.lua_ls.setup {
  cmd = { "/home/linuxbrew/.linuxbrew/bin/lua-language-server" },  -- Full path to lua-language-server 
}

return {
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua filen
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
 	    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      },
    },
  },
}

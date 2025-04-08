return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" }, -- load early for LSP
  config = function()
    local lspconfig = require("lspconfig")

    -- Golang
    lspconfig.gopls.setup({})

    -- Lua (Neovim dev)
    lspconfig.lua_ls.setup({
      settings = {
        Lua = {
          diagnostics = {
            globals = { "vim" },
          },
          workspace = {
            library = vim.api.nvim_get_runtime_file("", true),
            checkThirdParty = false,
          },
        },
      },
    })

    -- Java
    lspconfig.jdtls.setup({})

    -- C/C++
    lspconfig.clangd.setup({})
  end,
}




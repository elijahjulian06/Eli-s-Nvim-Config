return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",  -- auto-update parsers when the plugin is installed or updated
  event = { "BufReadPost", "BufNewFile" }, -- lazy-load on file open
  config = function()
    require("nvim-treesitter.configs").setup {
      ensure_installed = { "lua", "java", "go", "c" },
      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
    }
  end
}


 
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
 
 
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and configure plugins
require("lazy").setup({
  spec = {
    -- Plugin Definitions
    { "wbthomason/packer.nvim" },   -- Packer itself (if you want to manage it through lazy.nvim)
    { "rstacruz/vim-closer" },      -- Vim Closer

    {
      "nvim-telescope/telescope.nvim", 
      tag = "0.1.8", 
      requires = { "nvim-lua/plenary.nvim" }
    },

    -- Rose-Pine colorscheme
    
    {
      "rose-pine/neovim", 
      as = "rose-pine", 
      config = function()
        vim.cmd("colorscheme rose-pine")
      end
    },

    -- Treesitter and Playground
    { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" },
    { "nvim-treesitter/playground" },

    -- Harpoon, Undotree, Fugitive
    { "theprimeagen/harpoon" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },

    -- LSP and Completion
    { "neovim/nvim-lspconfig" },
    { "ThePrimeagen/vim-be-good" },
    { "Saghen/blink.cmp" }
  },
  
  -- Options
  install = { colorscheme = { "rose-pine" } },  -- Optional: Set default colorscheme on install
  checker = { enabled = true },  -- Automatic updates for plugins
})


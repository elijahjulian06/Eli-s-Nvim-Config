 
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
    
      { "rstacruz/vim-closer" },
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
    { "Saghen/blink.cmp", 
        dependencies = { 'rafamadriz/friendly-snippets' },

        completion = { documentation = { auto_show = true } }
    }
  },
{
  'saghen/blink.cmp',
  -- optional: provides snippets for the snippet source
  dependencies = { 'rafamadriz/friendly-snippets' },

  -- use a release tag to download pre-built binaries
  version = '1.*',
  -- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
  -- build = 'cargo build --release',
  -- If you use nix, you can build from source using latest nightly rust with:
  -- build = 'nix run .#build-plugin',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
    -- 'super-tab' for mappings similar to vscode (tab to accept)
    -- 'enter' for enter to accept
    -- 'none' for no mappings
    { "neovim/nvim-lspconfig" },
    --
    -- All presets have the following mappings:
    -- C-space: Open menu or open docs if already open
    -- C-n/C-p or Up/Down: Select next/previous item
    -- C-e: Hide menu
    -- C-k: Toggle signature help (if signature.enabled = true)
    --
    -- See :h blink-cmp-config-keymap for defining your own keymap
    keymap = { preset = 'default' },

    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },

    -- (Default) Only show the documentation popup when manually triggered
    completion = { documentation = { auto_show = false } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning" }
  },
  opts_extend = { "sources.default" }
}, 
  -- Options
  install = { colorscheme = { "rose-pine" } },  -- Optional: Set default colorscheme on install
  checker = { enabled = true },  -- Automatic updates for plugins
})


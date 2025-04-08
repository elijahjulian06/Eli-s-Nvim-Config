-- Example for rose-pine colorscheme plugin in lazy.nvim

return {
{
  'rose-pine/neovim',
  as = 'rose-pine',
  config = function()
    vim.cmd('colorscheme rose-pine')
  end
}
}


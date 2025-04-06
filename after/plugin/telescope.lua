local builtin = require('telescope.builtin')

return {
{
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    require("telescope").setup()
  end,
  keys = {
    -- Add a keymap to browse plugin files
    {  
      vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
    },

    {
     vim.keymap.set('n', 'C-p', builtin.git_files, {})
    },

    {
        vim.keymap.set('n', '<leader>ps', function() 

        	builtin.grep_string({ search = vim.fn.input("Grep > ") });

        end)
    },

    {
      "<leader>fp",
      function()
        require("telescope.builtin").find_files({
          cwd = require("lazy.core.config").options.root,
        })
      end,
      desc = "Find Plugin File",
    },
  },
},
}




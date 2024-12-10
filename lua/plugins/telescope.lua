return {
  {
    "nvim-telescope/telescope.nvim",
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    keys = {
      {
        "<leader>f",
        function()
          local builtin = require("telescope.builtin")
          builtin.find_files()
        end,
        desc = "Find file"
      },
      {
        "<leader>g",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep({
            find_command = { "rg", "--hidden", "--no-ignore", "--follow" },
          })
        end,
        desc = "Find word"
      },
      {
        "<leader><leader>",
        function()
          local builtin = require("telescope.builtin")
          builtin.oldfiles({})
        end,
        desc = "Recent files"
      },
    },
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup{
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      -- To get ui-select loaded and working with telescope, you need to call
      -- load_extension, somewhere after setup function:
      require("telescope").load_extension("ui-select")
    end
  }
}

return {
  { "github/copilot.vim" },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("CopilotChat").setup {
        debug = true,
        auto_insert_mode = true,
        window = {
          width = 0.4,
        },
        question_header = " Scott ",
        answer_header = " Copilot ",
      }

      vim.keymap.set("n", '<leader>cc', vim.cmd.CopilotChat)
      vim.keymap.set("v", '<leader>cc', vim.cmd.CopilotChat)

      local copilot_on = true

      vim.api.nvim_create_user_command("CopilotToggle", function()
        if copilot_on then
          vim.cmd("Copilot disable")
          print("Copilot OFF")
        else
          vim.cmd("Copilot enable")
          print("Copilot ON")
        end
        copilot_on = not copilot_on
      end, { nargs = 0 })

      vim.api.nvim_create_autocmd("BufEnter", {
        pattern = "copilot-chat",
        callback = function()
          vim.opt_local.relativenumber = false
          vim.opt_local.number = false
        end,
      })

      vim.keymap.set("n", "<leader>ct", ":CopilotToggle<CR>", { noremap = true, silent = true })
    end
  },
}

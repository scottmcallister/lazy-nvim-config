return {
  "terrortylor/nvim-comment",
  config = function()
    require("nvim_comment").setup({
      comment_empty = false,
      create_mappings = true
    })
    -- Add custom key mapping with description
    vim.api.nvim_set_keymap('v', '<leader>/', '<cmd>lua require("nvim_comment").comment_toggle()<CR>', { noremap = true, silent = true, desc = "Comment out selected lines" })
  end
}

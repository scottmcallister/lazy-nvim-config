return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('ruby_lsp', {
        capabilities = capabilities
      })
      vim.lsp.config('lua_ls', {
        capabilities = capabilities,
      })
      vim.lsp.config('ts_ls', {
        capabilities = capabilities,
      })
      vim.lsp.config('jdtls', {
        capabilities = capabilities,
      })
      --
      -- -- Set indentation for Ruby files
      -- vim.api.nvim_create_autocmd("FileType", {
      --   pattern = "ruby",
      --   callback = function()
      --     vim.bo.shiftwidth = 2
      --     vim.bo.tabstop = 2
      --     vim.bo.expandtab = true
      --   end,
      -- })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end,
  },
}

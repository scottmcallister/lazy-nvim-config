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
      ensure_installed = { "ruby_lsp", "lua_ls", "ts_ls", "jdtls", "emmet_ls" },
      automatic_enable = false,
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      vim.lsp.config('ruby_lsp', {
        capabilities = capabilities,
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
      vim.lsp.config('emmet_ls', {
        capabilities = capabilities,
        filetypes = {
          'html',
          'css',
          'scss',
          'less',
          'javascriptreact',
          'typescriptreact',
          'vue',
          'svelte',
          'php',
          'eruby',
        }
      })

      --
      vim.lsp.enable({
        'ruby_lsp',
        'lua_ls',
        'ts_ls',
        'jdtls',
        'emmet_ls'
      })
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {})
    end,
  },
}

return {
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
  },
  {
    "nvim-java/nvim-java",
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "jdtls",
          "lua_ls",
          "ruby_lsp",
          "tailwindcss",
          "ts_ls"
        }
      })
      require("java").setup()
      local lspconfig = require("lspconfig")
      lspconfig.lua_ls.setup({})
      lspconfig.ts_ls.setup({})
      lspconfig.ruby_lsp.setup({})
      lspconfig.jdtls.setup({})
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = 'Show hover' })
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
    end
  }
}

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "ruby",
        "lua",
        "typescript",
        "java",
        "tailwindcss",
      },
    },
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

      local lspconfig = require("lspconfig")
      lspconfig.ruby_lsp.setup({
        capabilities = capabilities
      })
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.jdtls.setup({
        capabilities = capabilities,
      })
      lspconfig.tailwindcss.setup({
        capabilities = capabilities,
        init_options = {
          userLanguages = {
            eruby = "erb",
          },
        },
        filetypes = {
          "html",
          "css",
          "scss",
          "javascript",
          "typescript",
          "javascriptreact",
          "typescriptreact",
          "eruby",
        },
      })

      -- Set indentation for Ruby files
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "ruby",
        callback = function()
          vim.bo.shiftwidth = 2
          vim.bo.tabstop = 2
          vim.bo.expandtab = true
        end,
      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "gf", vim.lsp.buf.format, {})
      vim.keymap.set("n", "ca", vim.lsp.buf.code_action, {})
      vim.keymap.set('n', 'rn', vim.lsp.buf.rename, {})
    end,
  },
}

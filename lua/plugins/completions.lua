return {
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = {
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets",
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "onsails/lspkind-nvim",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      local lspkind = require("lspkind")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),

          ["<CR>"] = cmp.mapping.confirm({
            select = true,
          }),

          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),

        formatting = {
          format = function(entry, vim_item)
            vim_item.menu = entry.source.name
            return lspkind.cmp_format({})(entry, vim_item)
          end,
        },

        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          {
            name = "luasnip",
            entry_filter = function(entry, ctx)
              -- Extracts the alphanumeric word immediately behind cursor
              local word = ctx.cursor_before_line:match("%a+$")

              local forbidden_keywords = {
                ["else"] = true,
                ["elsif"] = true,
                ["end"] = true,
                ["if"] = true,
                ["unless"] = true
              }
              if forbidden_keywords[word] then
                return false
              end

              return true
            end
          },
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}

-- return {
--   {
--     "hrsh7th/cmp-nvim-lsp"
--   },
--   {
--     "L3MON4D3/LuaSnip",
--     dependencies = {
--       "saadparwaiz1/cmp_luasnip",
--       "rafamadriz/friendly-snippets",
--     },
--   },
--   {
--     "hrsh7th/nvim-cmp",
--     dependencies = {
--       "onsails/lspkind-nvim",
--     },
--     config = function()
--       local cmp = require("cmp")
--       require("luasnip.loaders.from_vscode").lazy_load()
--       local lspkind = require("lspkind")
--
--       cmp.setup({
--         snippet = {
--           expand = function(args)
--             require("luasnip").lsp_expand(args.body)
--           end,
--         },
--         window = {
--           completion = cmp.config.window.bordered(),
--           documentation = cmp.config.window.bordered(),
--         },
--         mapping = cmp.mapping.preset.insert({
--           ["<C-b>"] = cmp.mapping.scroll_docs(-4),
--           ["<C-f>"] = cmp.mapping.scroll_docs(4),
--           ["<C-Space>"] = cmp.mapping.complete(),
--           ["<C-e>"] = cmp.mapping.abort(),
--           ["<CR>"] = cmp.mapping.confirm({ select = true }),
--         }),
--         formatting = {
--           format = function(entry, vim_item)
--             vim_item.menu = entry.source.name
--             return lspkind.cmp_format({})(entry, vim_item)
--           end,
--         }, -- formatting
--         sources = cmp.config.sources({
--           { name = 'nvim_lsp' },
--           { name = 'buffer' },
--           { name = 'path' },
--           { name = 'luasnip' },
--         }),
--       })
--     end,
--   },
-- }

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local alpha = require("alpha")
    local dashboard = require("alpha.themes.dashboard")
    -- Set menu
    dashboard.section.buttons.val = {
        dashboard.button( "LDR f ", "  > Find file", "<leader>f"),
        dashboard.button( "LDR g ", "  > Fuzzy grep" , "<leader>g"),
        dashboard.button( "LDR e ", "  > Directory Tree" , "<leader>e"),
        dashboard.button( "LDR cc", "󰭻  > Copilot Chat" , "<leader>cc"),
        dashboard.button( "LDR co", "󰭻  > CodeCompanion Chat" , "<leader>co"),
        dashboard.button( "LDR r ", "  > Update config", ":cd ~/.config/nvim<CR>"),
        dashboard.button( "LDR q ", "󰈆  > Quit NVIM", "<leader>q"),
    }
    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    alpha.setup(dashboard.opts)
  end,
}

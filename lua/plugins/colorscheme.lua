function ReadFromFile()
  local home = os.getenv("HOME")
  local file = io.open(home .. "/.config/nvim/color.txt", "r")
  if file == nil then
    return nil, "Failed to open file for reading"
  end
  local content = file:read("*a")
  file:close()
  return content
end

local popup = require('plenary.popup')

local Win_id

function WriteToFile(color)
  local home = os.getenv("HOME")
  local file = io.open(home .. "/.config/nvim/color.txt", "w")
  if file == nil then
    return nil, "Failed to open file for writing"
  end
  file:write(color)
  file:close()
  return true
end

function ShowMenu(opts, cb)
  local height = 20
  local width = 30
  local borderchars = { '─', '│', '─', '│', '╭', '╮', '╯', '╰' }

  Win_id = popup.create(opts, {
    title = "My Pencils",
    highlight = "MyProjectWindow",
    line = math.floor(((vim.o.lines - height) / 2) - 1),
    col = math.floor((vim.o.columns - width) / 2),
    minwidth = width,
    minheight = height,
    borderchars = borderchars,
    callback = cb,
  })
  local bufnr = vim.api.nvim_win_get_buf(Win_id)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "q", "<cmd>lua CloseMenu()<CR>", { silent=false })
end

function CloseMenu()
  vim.api.nvim_win_close(Win_id, true)
end


function ColorMyPencils(param)
  local color
  local options = {
    "tokyonight",
    "catppuccin",
    "everforest",
    "nord",
    "rose-pine",
  }

  if param then
    color = param
	  -- vim.cmd.colorscheme(color)
    vim.cmd("colorscheme " .. color)
  else
    ShowMenu(options, function(_, sel)
      color = sel
	    vim.cmd.colorscheme(color)
      WriteToFile(color)
    end)
  end
end

local default = ReadFromFile() or "nord"


return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      return {
        require("rose-pine").setup({
          variant = "dawn",
        })
      }
    end
  },
  { "neanias/everforest-nvim", name = "everforest" },
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    'shaunsingh/nord.nvim',
    lazy = false,
    priority = 1000,
    name = 'nord',
    config = function()
      ColorMyPencils(default)
      vim.keymap.set("n", '<leader>cs', function()
       ColorMyPencils()
      end)
    end
  },
}

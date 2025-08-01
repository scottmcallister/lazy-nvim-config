vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.bo.softtabstop = 2

vim.opt.smartindent = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"

-- setup `mapleader` and `maplocalleader`
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- move selected text and keep it selected
vim.api.nvim_set_keymap('v', '<', '<gv', {noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '>', '>gv', {noremap = true, silent = true})

-- swap between windows
vim.api.nvim_set_keymap("n", "<leader><TAB>", "<C-w>w", { desc = "Next buffer" })
vim.api.nvim_set_keymap("n", "<leader><S-TAB>", "<C-w>W", { desc = "Previous buffer" })

-- shift highlighted text up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- keep curor in middle when jumping 
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- shortcut to quit
vim.keymap.set("n", "<leader>q", ":qa!<CR>", { desc = "Quit nvim" })

-- copy to the system clipboard when yanking
vim.opt.clipboard = "unnamedplus"

vim.api.nvim_set_keymap(
  'n',
  '<leader>tl',
  ':lua ToggleRelativeNumber()<CR>',
  {
    desc = 'Toggle relative number',
    noremap = true,
    silent = true
  }
)

function ToggleRelativeNumber()
    if vim.wo.relativenumber == true then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
end
--
-- -- Code Companion keybindings
-- vim.api.nvim_set_keymap('n', '<leader>co', ':CodeCompanionChat<CR>', { desc = "Code Companion" })
-- vim.api.nvim_set_keymap('v', '<leader>co', ':CodeCompanionChat<CR>', { desc = "Code Companion" })
--
-- -- Expand 'cc' into 'CodeCompanion' in the command line
-- vim.cmd([[cab cc CodeCompanion]])
-- vim.cmd('let g:lsp_max_listeners = 20')

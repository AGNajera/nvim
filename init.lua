vim.g.mapleader = " "

--Remaps
vim.keymap.set("n", "<leader>b", vim.cmd.Ex)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Sets basicos
vim.opt.nu = true
vim.opt.relativenumber = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.signcolumn = "yes:1"
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 8
vim.o.smartcase = true
vim.o.ignorecase = true
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25

-- Plugins
vim.pack.add {
	'https://github.com/folke/tokyonight.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
}
vim.cmd[[colorscheme tokyonight-moon]]
require('nvim-highlight-colors').setup({})

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ps', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>pw', function()
    local word = vim.fn.expand("<cword>")
    builtin.grep_string({ search = word })
end)
vim.keymap.set('n', '<leader>pr', function()
    local word = vim.fn.expand("<cWORD>")
    builtin.grep_string({ search = word })
end)

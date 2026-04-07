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
vim.o.cursorline = true
vim.g.netrw_banner = 0
vim.g.netrw_browse_split = 0
vim.g.netrw_winsize = 25
vim.diagnostic.config({ virtual_text = true })

-- Plugins
vim.pack.add {
    'https://github.com/folke/tokyonight.nvim',
    'https://github.com/neovim/nvim-lspconfig',
    'https://github.com/brenoprata10/nvim-highlight-colors',
    'https://github.com/nvim-lua/plenary.nvim',
    'https://github.com/nvim-telescope/telescope.nvim',
    'https://github.com/mason-org/mason.nvim',
    'https://github.com/mason-org/mason-lspconfig.nvim',
    'https://github.com/saghen/blink.cmp',
}

-- Mason
require("mason").setup()
require("mason-lspconfig").setup({
    ensure_installed = { "lua_ls", "ts_ls", "basedpyright" }
})

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

-- LSP
vim.lsp.enable({ "lua_ls", "ts_ls" })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Ir a definición" })
vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Mostrar documentación" })
vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, { desc = "Renombrar variable" })
vim.keymap.set('n', '<leader>c', vim.lsp.buf.code_action, { desc = "Acciones de código" })

-- Blink
require('blink.cmp').setup({
    sources = {
        default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    fuzzy = {
        implementation = "lua"
    },

    snippets = {
        preset = 'default',
    },

    keymap = {
        preset = 'none', -- <C-space> para completar, <Tab> para confirmar
        -- Mapeos para navegar el menú con las flechas o C-n/C-p
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-n>'] = { 'select_next', 'fallback' },
    },

    -- Opcional: Mostrar bordes en la ventana de completado
    completion = {
        menu = { border = 'rounded' },
        documentation = { window = { border = 'rounded' } },
    },
})

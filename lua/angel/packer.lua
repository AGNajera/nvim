-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }	

  use({
	  'rose-pine/neovim',
	  as = 'rose-pine',
	  config = function()
		vim.cmd('colorscheme rose-pine')
	  end
  })

   require 'nvim-treesitter.install'.prefer_git = false
   require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use('/ThePrimeagen/harpoon')
  use('nvim-lua/plenary.nvim')
  use('tpope/vim-fugitive')
  
  use {
	  "jiaoshijie/undotree",
	  config = function()
		  require('undotree').setup()
	  end,
	  requires = {
		  "nvim-lua/plenary.nvim",
	  },
  }

  use({'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'})
  use({'neovim/nvim-lspconfig'})
  use({'hrsh7th/nvim-cmp'})
  use({'hrsh7th/cmp-nvim-lsp'})
  

  use {
    "williamboman/mason.nvim"
}

end)

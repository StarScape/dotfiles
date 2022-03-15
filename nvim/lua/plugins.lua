-- Packer bootstrap
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'

  -- Packer itself must be required, otherwise :PackerClean command will see its
  -- dir and uninstall it, thinking it's not being used since it is not registered here
  use 'wbthomason/packer.nvim'

  use 'marko-cerovac/material.nvim'
  use 'jiangmiao/auto-pairs'
  use 'nvim-lua/popup.nvim'
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'jremmen/vim-ripgrep'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  -- use 'beauwilliams/statusline.lua'

  -- Language stuff
  use 'clojure-vim/clojure.vim'
  use 'junegunn/rainbow_parentheses.vim'
  use 'Olical/conjure'

  -- God bless Tim Pope
  use 'tpope/vim-surround'
  use 'tpope/vim-commentary'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-sleuth'

  use 'eraserhd/parinfer-rust'

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)


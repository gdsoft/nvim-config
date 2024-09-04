-- Packer.nvim 安装
local install_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.system({ 'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.api.nvim_command('packadd packer.nvim')
end

-- 加载vim.lsp插件
local packer = require('packer')
packer.startup(function(use)
  -- Packer 可以管理自己本身
  use('wbthomason/packer.nvim')

  --------------------- colorschemes --------------------
  -- tokyonight
  use('folke/tokyonight.nvim')
  -- OceanicNext
  use('mhartington/oceanic-next')
  -- gruvbox
  use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } })
  -- nord
  use('shaunsingh/nord.nvim')
  -- onedark
  use('ful1e5/onedark.nvim')
  -- nightfox
  use('EdenEast/nightfox.nvim')
  -------------------------------------------------------

  -- nvim-tree
  use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' },
  })

  --------------------- LSP --------------------
  use('williamboman/nvim-lsp-installer')
  -- Lspconfig
  -- use({ "neovim/nvim-lspconfig" })
  use({
    'neovim/nvim-lspconfig',
    config = function()
      -- composer global require phpactor/phpactor
      local lspconfig = require('lspconfig')
      lspconfig.phpactor.setup({
        cmd = { 'phpactor', 'language-server' },
        filetypes = { 'php' },
        root_dir = function(pattern)
          local cwd = vim.loop.cwd()
          local root = require('lspconfig.util').root_pattern('composer.json', '.git')(pattern)
          return require('lspconfig.util').path.is_descendant(cwd, root) and cwd or root
        end,
      })
    end,
  })

  -- lualine
  use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
  use('arkav/lualine-lsp-progress')

  -- php
  use('beanworks/vim-phpfmt')
  use('StanAngeloff/php.vim')
  use('vim-vdebug/vdebug')

  -- telescope
  use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })

  -- telescope extensions
  use('LinArcX/telescope-env.nvim')

  -- dashboard-nvim
  use('glepnir/dashboard-nvim')

  -- project
  use('ahmedkhalf/project.nvim')

  -- treesitter
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })

  -- 代码格式化 (新增)
  use('mhartington/formatter.nvim')

  -- use 'neoclide/coc.nvim'

  -- emmet
  use('mattn/emmet-vim')

  -- 补全引擎
  use('hrsh7th/nvim-cmp')
  -- snippet 引擎
  use('hrsh7th/vim-vsnip')
  -- 补全源
  use('hrsh7th/cmp-vsnip')
  use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
  use('hrsh7th/cmp-buffer')   -- { name = 'buffer' },
  use('hrsh7th/cmp-path')     -- { name = 'path' }
  use('hrsh7th/cmp-cmdline')  -- { name = 'cmdline' }

  -- 常见编程语言代码段
  use('rafamadriz/friendly-snippets')
end)

-- 每次保存 plugins.lua 自动安装插件
pcall(
  vim.cmd,
  [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)

-- telescope extensions
-- pcall(telescope.load_extension, "env")

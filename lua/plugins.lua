-- 插件列表
return {
  -- colorschemes
  { "folke/tokyonight.nvim" },
  { "mhartington/oceanic-next" },
  { "ellisonleao/gruvbox.nvim", dependencies = { "rktjmp/lush.nvim" } },
  { "shaunsingh/nord.nvim" },
  { "ful1e5/onedark.nvim" },
  { "EdenEast/nightfox.nvim" },

  -- nvim-tree
  { "kyazdani42/nvim-tree.lua", dependencies = { "kyazdani42/nvim-web-devicons" } },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
  },

  -- LSP
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim", -- 与 Mason 集成
      "neovim/nvim-lspconfig",             -- LSP 配置
    },
    build = ":MasonUpdate", -- 确保 Mason 插件更新
    config = function()
      -- 使用 Mason-Lspconfig 来管理 Language Server 的安装和配置
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "phpactor" }, -- 自动安装 phpactor
      })

      -- 使用新的 API 配置 phpactor
      vim.lsp.config("phpactor", {
        cmd = { "phpactor", "language-server" },
        filetypes = { "php" },
        root_dir = function(pattern)
          local cwd = vim.loop.cwd()
          local root = require("lspconfig.util").root_pattern("composer.json", ".git")(pattern)
          return require("lspconfig.util").path.is_descendant(cwd, root) and cwd or root
        end,
      })
    end,
  },

  -- lualine
  { "nvim-lualine/lualine.nvim", dependencies = { "kyazdani42/nvim-web-devicons" } },
  { "arkav/lualine-lsp-progress" },

  -- PHP
  { "beanworks/vim-phpfmt" },
  { "StanAngeloff/php.vim" },
  { "vim-vdebug/vdebug" },

  -- telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- telescope extensions
  { "LinArcX/telescope-env.nvim" },

  -- dashboard-nvim
  { "glepnir/dashboard-nvim" },

  -- project
  { "ahmedkhalf/project.nvim" },

  -- treesitter
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

  -- 代码格式化 (新增)
  -- { "mhartington/formatter.nvim" },
  -- { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
  -- { "neoclide/coc.nvim" },

  -- emmet
  { "mattn/emmet-vim" },

  -- 补全引擎
  -- { "L3MON4D3/LuaSnip" },
  { "hrsh7th/nvim-cmp" },

  -- snippet 引擎
  { "hrsh7th/vim-vsnip" },

  -- 补全源
  { "hrsh7th/cmp-vsnip" },
  { "hrsh7th/cmp-nvim-lsp" }, -- { name = nvim_lsp }
  { "hrsh7th/cmp-buffer" },   -- { name = 'buffer' }
  { "hrsh7th/cmp-path" },     -- { name = 'path' }
  { "hrsh7th/cmp-cmdline" },  -- { name = 'cmdline' }

  -- gitsigns
  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("gitsigns").setup()
    end,
  },

  -- 常见编程语言代码段
  { "rafamadriz/friendly-snippets" },

  -- JSON 增强
  { "b0o/schemastore.nvim" },

  -- TypeScript 增强（替代 nvim-lsp-ts-utils）
  { "pmizio/typescript-tools.nvim", dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } }

}

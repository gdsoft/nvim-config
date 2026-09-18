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
  { "nvim-tree/nvim-tree.lua", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons", "moll/vim-bbye" },
  },

  -- LSP / Mason（语言服务器装配见 lua/lsp/setup.lua）
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "neovim/nvim-lspconfig",
    },
    build = ":MasonUpdate",
  },

  -- Rust 增强（rust-analyzer 由其接管）
  {
    "mrcjkb/rustaceanvim",
    version = "^5",
    lazy = false,
    config = function()
      vim.g.rustaceanvim = {
        tools = { autoSetHints = true },
        server = {
          on_attach = function(client, bufnr)
            local function buf_set_keymap(mode, lhs, rhs, opts)
              vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts or {})
            end
            require("keybindings").mapLSP(buf_set_keymap)
          end,
        },
      }
    end,
  },

  -- 调试 (DAP)
  { "mfussenegger/nvim-dap", lazy = true },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    dependencies = { "mfussenegger/nvim-dap" },
    lazy = true,
  },

  -- lualine
  { "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

  -- telescope
  { "nvim-telescope/telescope.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- dashboard-nvim
  { "nvimdev/dashboard-nvim" },

  -- treesitter（统一配置见 lua/plugin-config/nvim-treesitter.lua）
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },

  -- 浮动窗口终端
  { "akinsho/toggleterm.nvim", version = "*" },

  -- 代码格式化/lint（配置见 lua/lsp/null-ls.lua）
  { "nvimtools/none-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

  -- 补全引擎
  { "hrsh7th/nvim-cmp" },

  -- snippet 引擎
  {
    "L3MON4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  },

  -- 补全源
  { "hrsh7th/cmp-nvim-lsp" },
  { "saadparwaiz1/cmp_luasnip" },
  { "hrsh7th/cmp-buffer" },
  { "hrsh7th/cmp-path" },
  { "hrsh7th/cmp-cmdline" },

  -- GitHub Copilot（AI 补全）
  { "github/copilot.vim" },

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
}

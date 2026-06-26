-- Neovim 配置实战：从0到1打造己的IDE
-- https://juejin.cn/book/7051157342770954277

-- 基础配置
require('basic')

-- Lazy.nvim bootstrap
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- 插件管理（加载 lua/plugins.lua）
require("lazy").setup("plugins", {
  git = {
    url_format = "git@github.com:%s.git",
  }
})

-- 快捷键映射
require('keybindings')

-- 主题设置
require('colorscheme')

-- 插件配置
require('plugin-config.nvim-tree')
require('plugin-config.bufferline')
require('plugin-config.lualine')
require('plugin-config.telescope')
require('plugin-config.dashboard')
require('plugin-config.project')
require('plugin-config.nvim-treesitter')

-- 内置LSP
require('lsp.setup')
require('lsp.cmp')
require('lsp.ui')
--require('lsp.formatter')
--require('lsp.null-ls')

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "plugins.lua",
  command = "source <afile> | Lazy sync",
})

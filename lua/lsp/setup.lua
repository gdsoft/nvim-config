-- 引入 Mason 和相关依赖
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- 安装列表：{ key = 语言服务器名称, value = 配置文件 }
local servers = {
  --lua_ls       = require("lsp.config.lua_ls"),
  --html         = require("lsp.config.html"),
  --cssls        = require("lsp.config.css"),
  --jsonls       = require("lsp.config.json"),
  --tsserver     = require("lsp.config.ts"),       -- 注意改成 tsserver
  --emmet_ls     = require("lsp.config.default"),
  --csharp_ls    = require("lsp.config.default"),
  --pylsp        = require("lsp.config.default"),
  --intelephense = require("lsp.config.default"),
}

-- 初始化 Mason
mason.setup()

-- 配置 Mason-Lspconfig
mason_lspconfig.setup({
  ensure_installed = vim.tbl_keys(servers), -- 自动安装列表中定义的语言服务器
})

-- 遍历 servers 表，逐个调用 lspconfig
for server_name, config in pairs(servers) do
  if config and config.on_setup then
    vim.lsp.config(server_name, config.on_setup())
  else
    vim.lsp.config(server_name, {})
  end
end

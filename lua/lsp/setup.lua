local lsp_installer = require("nvim-lsp-installer")

-- 安装列表
-- { key: 语言 value: 配置文件 }
-- key 必须为下列网址列出的名称
-- https://github.com/williamboman/nvim-lsp-installer#available-lsps
local servers = {
  lua_ls = require("lsp.config.lua_ls"), -- lua/lsp/config/lua_ls.lua
}

local lspconfig = require("lspconfig")

-- 自动安装 Language Servers
for name, _ in pairs(servers) do
  local server_is_found, server = lsp_installer.get_server(name)
  if server_is_found then
    if not server:is_installed() then
      print("Installing " .. name)
      server:install()
    end
  else
    -- 如果服务不在nvim-lsp-installer的管理下
    -- 不能被自动安装，手动安装对应的LSP服务之后
    -- 在这里设置配置文件
    server = lspconfig[name]
    local config = servers[name]
    if config.on_setup then
      config.on_setup(server)
    end
  end
end

-- 若是在nvim-lsp-installer的管理下，
-- 自动安装之后会回调下面函数进行配置文件的设置
lsp_installer.on_server_ready(function(server)
  local config = servers[server.name]
  if config == nil then
    return
  end
  if config.on_setup then
    config.on_setup(server)
  else
    server:setup({})
  end
end)

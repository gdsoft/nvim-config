-- 引入 Mason 和相关依赖
local mason = require('mason')
local mason_lspconfig = require('mason-lspconfig')
local lspconfig = require('lspconfig')

-- 安装列表：{ key = 语言服务器名称, value = 配置文件 }
local servers = {
    lua_ls = require('lsp.config.lua_ls'), -- lua/lsp/config/lua_ls.lua
    html = require('lsp.config.html'), -- lua/lsp/config/html.lua
    cssls = require('lsp.config.css'),
    jsonls = require('lsp.config.json'),
    ts_ls = require('lsp.config.ts'),
    emmet_ls = require('lsp.config.default'),
    csharp_ls = require('lsp.config.default'),
    pylsp = require('lsp.config.default'),
    intelephense = require('lsp.config.default'),
}

-- 初始化 Mason
mason.setup()

-- 配置 Mason-Lspconfig
mason_lspconfig.setup({
    ensure_installed = vim.tbl_keys(servers), -- 自动安装列表中定义的语言服务器
})

-- 自动设置语言服务器
mason_lspconfig.setup_handlers({
    function(server_name)
        -- 如果该语言服务器存在配置文件，则使用它进行自定义设置
        local config = servers[server_name]
        if config and config.on_setup then
            config.on_setup(lspconfig[server_name])
        else
            -- 如果没有自定义配置，使用默认设置
            lspconfig[server_name].setup({})
        end
    end,
})

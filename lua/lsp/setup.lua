-- 语言服务器装配：mason 安装二进制 + lspconfig 连接
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup()

-- lua_ls：编辑本机 Neovim 配置时识别 vim 全局
vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      runtime = { version = "LuaJIT" },
      workspace = { library = { vim.env.VIMRUNTIME } },
      diagnostics = { globals = { "vim" } },
    },
  },
})

mason_lspconfig.setup({
  ensure_installed = { "clangd", "rust_analyzer", "lua_ls" },
  handlers = {
    -- rust_analyzer 交由 rustaceanvim 接管，这里不重复启用
    ["rust_analyzer"] = function() end,
    function(server_name)
      vim.lsp.enable(server_name)
    end,
  },
})

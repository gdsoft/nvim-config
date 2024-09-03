local runtime_path = vim.split(package.path, ';')

table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

local opts = {
  Lua = {
    runtime = {
      -- Tell the language server which version of Lua you're using
      -- (most likely LuaJIT in the case of Neovim)
      version = 'LuaJIT',
      -- Setup your lua path
      path = runtime_path,
    },
    -- Make the server aware of Neovim runtime files
    workspace = {
      checkThirdParty = false,
      library = {
        vim.env.VIMRUNTIME,
        -- "${3rd}/luv/library"
        -- "${3rd}/busted/library",
      },
      -- or pull in all of 'runtimepath'. NOTE: this is a lot slower
      -- library = vim.api.nvim_get_runtime_file("", true)
    },
    diagnostics = {
      -- Get the language server to recognize the `vim` global
      globals = { 'vim' },
      enable = true,
    },
    completion = {
      enable = true,
    },
    -- Do not send telemetry data containing a randomized but unique identifier
    telemetry = {
      enable = false,
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
  on_attach = function(client, bufnr)
    -- 禁用格式化功能，交给专门插件插件处理
    --client.resolved_capabilities.document_formatting = false
    --client.resolved_capabilities.document_range_formatting = false

    local function buf_set_keymap(...)
      vim.api.nvim_buf_set_keymap(bufnr, ...)
    end
    -- 绑定快捷键
    require('keybindings').mapLSP(buf_set_keymap)

    -- 保存时自动格式化
    vim.cmd('autocmd BufWritePre <buffer> lua vim.lsp.buf.format()')
    --vim.cmd('autocmd BufWritePre <buffer> :Format')
  end,
}

-- 查看目录等信息
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}

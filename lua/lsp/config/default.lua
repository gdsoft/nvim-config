return {
  on_setup = function()
    return {
      -- 在这里写配置表
      settings = {},
      capabilities = vim.lsp.protocol.make_client_capabilities(),
      on_attach = function(client, bufnr)
        -- 这里写通用的 keymap 或 attach 逻辑
      end,
    }
  end,
}


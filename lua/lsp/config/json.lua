return {
  on_setup = function()
    return {
      settings = {
        json = {
          schemas = require('schemastore').json.schemas(),
        },
      },
      capabilities = require('cmp_nvim_lsp').default_capabilities(
        vim.lsp.protocol.make_client_capabilities()
      ),
      flags = {
        debounce_text_changes = 150,
      },
      on_attach = function(client, _)
        -- 禁用格式化功能，交由专门插件处理
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end,
    }
  end,
}


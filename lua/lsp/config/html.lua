return {
    on_setup = function(server)
        server:setup({
            -- 配置 LSP 客户端的能力
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),

            -- HTML 语言服务器的设置
            settings = {
                html = {
                    validate = { styles = true, scripts = true },
                    hover = true,
                },
            },

            -- 设置 Flags
            flags = {
                debounce_text_changes = 150,
            },

            -- 在语言服务器连接时的回调
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交由外部插件处理
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false

                -- 设置快捷键
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                require('keybindings').mapLSP(buf_set_keymap)
            end,
        })
    end,
}

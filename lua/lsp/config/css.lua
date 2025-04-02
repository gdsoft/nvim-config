return {
    on_setup = function(server)
        server:setup({
            -- 设置 LSP 客户端的能力 (capabilities)
            capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),

            -- 配置 CSS、Less 和 SCSS 的语言服务器验证功能
            settings = {
                css = {
                    validate = true,
                },
                less = {
                    validate = true,
                },
                scss = {
                    validate = true,
                },
            },

            -- 设置 Flags，减少文本变化时的频繁触发
            flags = {
                debounce_text_changes = 150,
            },

            -- 在语言服务器连接时的回调
            on_attach = function(client, bufnr)
                -- 禁用格式化功能，交由其他插件处理（如 null-ls）
                client.server_capabilities.documentFormattingProvider = false
                client.server_capabilities.documentRangeFormattingProvider = false

                -- 绑定快捷键
                local function buf_set_keymap(...)
                    vim.api.nvim_buf_set_keymap(bufnr, ...)
                end
                require('keybindings').mapLSP(buf_set_keymap)
            end,
        })
    end,
}

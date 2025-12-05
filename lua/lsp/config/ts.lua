local keybindings = require('keybindings')
local ts_utils = require('nvim-lsp-ts-utils')

local opts = {
    flags = {
        debounce_text_changes = 150, -- 降低频繁文本更新的处理次数
    },
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),

    on_attach = function(client, bufnr)
        -- 禁用格式化功能，交由其他插件（如 null-ls）处理
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false

        -- 设置快捷键绑定
        local function buf_set_keymap(...)
            vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        keybindings.mapLSP(buf_set_keymap)

        -- TypeScript 增强配置
        ts_utils.setup({
            debug = false, -- 禁用调试信息
            disable_commands = false, -- 启用默认命令
            enable_import_on_completion = false, -- 禁用自动导入完成
            -- 导入设置
            import_all_timeout = 5000, -- 导入超时时间 (ms)
            import_all_priorities = { -- 导入优先级
                same_file = 1, -- 现有文件中的导入语句
                local_files = 2, -- 本地文件 (Git 或相对路径)
                buffer_content = 3, -- 当前缓冲区的内容
                buffers = 4, -- 已加载的缓冲区
            },
            import_all_scan_buffers = 100, -- 扫描的缓冲区数
            import_all_select_source = false, -- 禁用来源选择
            always_organize_imports = true, -- 始终组织导入
            -- 诊断过滤配置
            filter_out_diagnostics_by_severity = {},
            filter_out_diagnostics_by_code = {},
            -- Inlay hints 设置
            auto_inlay_hints = true,
            inlay_hints_highlight = 'Comment',
            -- 文件移动时更新导入
            update_imports_on_move = false,
            require_confirmation_on_move = false,
            watch_dir = nil, -- 禁用目录监控
        })

        -- 配置 TypeScript 的诊断和代码操作范围
        ts_utils.setup_client(client)

        -- 设置 TypeScript 相关的快捷键绑定
        keybindings.mapTsLSP(buf_set_keymap)
    end,
}

return {
  on_setup = function()
    return opts
  end,
}

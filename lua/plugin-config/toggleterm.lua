require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t>]],          -- Ctrl+t 切换显示/隐藏
  hide_numbers = true,
  shade_filetypes = {},
  auto_scroll = true,
  shade_terminals = false,           -- 不遮罩背景，更像对话框
  shading_factor = -3,               -- 暗度
  start_in_insert = true,
  insert_mappings = true,
  terminal_maps = {
    ["<Esc>"] = "<C-\\><C-n>",       -- Esc 退出插入模式
  },
  winbar = {
    enabled = false,                 -- 关闭 winbar 保持简洁
  },
})

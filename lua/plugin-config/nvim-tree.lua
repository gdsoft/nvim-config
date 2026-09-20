local status, nvim_tree = pcall(require, "nvim-tree")
if not status then
  vim.notify("Not found nvim-tree!")
  return
end 

-- 列表操作快捷键
local list_keys = require('keybindings').nvimTreeList

-- 目录树始终使用独立背景色（无论是否有焦点）
vim.api.nvim_set_hl(0, 'NvimTreeNormal', { fg = '#abb2bf', bg = '#16161e' })
vim.api.nvim_set_hl(0, 'NvimTreeNormalNC', { fg = '#abb2bf', bg = '#16161e' })

nvim_tree.setup({
  -- 不显示 git 状态图标
  git = {
    enable = false,
  },
  -- project plugin 需要这样设置
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  -- 过滤规则
  filters = {
    dotfiles = false,
    custom = { 'node_modules' },
  },
  view = {
    -- 宽度
    width = 40,
    -- 也可以 'right'
    side = 'left',
    -- 隐藏根目录
    --hide_root_folder = false,
    -- 自定义列表中快捷键
    --[[
    mappings = {
      custom_only = false,
      list = list_keys,
    },
    ]]
    -- 不显示行数
    number = false,
    relativenumber = false,
    -- 显示图标
    signcolumn = 'yes',
  },
  actions = {
    open_file = {
      -- 首次打开大小适配
      resize_window = true,
      -- 打开文件时保持目录树开启
      quit_on_open = false,
    },
  },
  -- wsl install -g wsl-open
  -- https://github.com/4U6U57/wsl-open/
  --[[
  system_open = {
    cmd = 'wsl-open', -- mac 直接设置为 open
  },
  --]]
})
-- 自动关闭
vim.cmd([[
  autocmd BufEnter * ++nested if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif
]])

-- 启动时智能自动打开 nvim-tree（无参数或打开目录时）
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    if vim.fn.argc() == 0 or (vim.fn.argc() == 1 and vim.fn.isdirectory(vim.fn.argv(0)) == 1) then
      require("nvim-tree.api").tree.open()
    end
  end,
})

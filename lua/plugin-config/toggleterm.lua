require("toggleterm").setup({
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  -- open_mapping = [[<c-t>]],          -- Ctrl+t 切换显示/隐藏
  hide_numbers = true,
  shade_filetypes = {},
  auto_scroll = true,
  shade_terminals = false,
  shading_factor = -3,
  start_in_insert = true,
  insert_mappings = true,
  terminal_maps = {
    ["<Esc>"] = "<C-\\><C-n>",
  },
  winbar = {
    enabled = false,
  },
  highlights = {
    Normal = { guibg = "#181825" },
    NormalFloat = { link = "Normal" },
    FloatBorder = { guifg = "#585b70", guibg = "#181825" },
  },
  on_open = function(term)
    -- 统一应用终端高亮组（split/float 通用）
    vim.api.nvim_win_set_option(term.window, "winhl", "Normal:TermNormal,FloatBorder:TermBorder")
  end,
})

-- 定义高亮组（放 setup 外部，colorscheme 后生效）
vim.api.nvim_set_hl(0, "TermNormal", { bg = "#181825" })
vim.api.nvim_set_hl(0, "TermBorder", { fg = "#585b70", bg = "#181825" })

local copilot_cli = require("toggleterm.terminal").Terminal:new({
  cmd = "copilot",
  direction = "float",
  hidden = true,
  close_on_exit = true,
  float_opts = {
    border = "curved",
    winblend = 3,
  },
  on_open = function()
    vim.cmd("startinsert!")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader>cc", function()
  copilot_cli:toggle()
end, { desc = "Toggle Copilot CLI" })

local copilot_right = require("toggleterm.terminal").Terminal:new({
  cmd = "copilot",
  direction = "vertical",
  size = function(term)
    return vim.o.columns * 0.35
  end,
  hidden = true,
  close_on_exit = true,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_win_set_option(term.window, "winhl", "Normal:TermNormal,FloatBorder:TermBorder")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader>cv", function()
  copilot_right:toggle()
end, { desc = "Toggle Copilot Vertical (35%)" })

local opencode_cli = require("toggleterm.terminal").Terminal:new({
  cmd = "opencode",
  direction = "float",
  hidden = true,
  close_on_exit = false,
  float_opts = {
    border = "curved",
    winblend = 3,
  },
  on_open = function()
    vim.cmd("startinsert!")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader>oc", function()
  opencode_cli:toggle()
end, { desc = "Toggle OpenCode" })

local opencode_right = require("toggleterm.terminal").Terminal:new({
  cmd = "opencode",
  direction = "vertical",
  size = function(term)
    return vim.o.columns * 0.35
  end,
  hidden = true,
  close_on_exit = false,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_win_set_option(term.window, "winhl", "Normal:TermNormal,FloatBorder:TermBorder")
  end,
})

vim.keymap.set({ "n", "t" }, "<leader>ov", function()
  opencode_right:toggle()
end, { desc = "Toggle OpenCode Vertical (35%)" })

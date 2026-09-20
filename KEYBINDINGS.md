# Neovim 快捷键

这份文档对应当前 `~/.config/nvim` 配置。默认 `<leader>` 是逗号 `,`。

## 窗口与终端

| 快捷键 | 作用 |
|---|---|
| `sv` | 垂直分屏 |
| `sh` | 水平分屏 |
| `sc` | 关闭当前窗口 |
| `so` | 只保留当前窗口 |
| `Alt-h/j/k/l` | 在窗口之间移动（支持普通模式及终端/OpenCode 内部） |
| `Ctrl-Left/Right` | 调整垂直尺寸 |
| `Ctrl-Up/Down` | 调整水平尺寸 |
| `s=` | 窗口等比例 |
| `<C-t>` | 切换终端显示/隐藏 |
| `<leader>th` | 打开水平终端 |
| `<leader>tv` | 打开垂直终端 |
| `<leader>tc` | 打开浮动终端 |

## 文件、缓冲区与搜索

| 快捷键 | 作用 |
|---|---|
| `Ctrl-h/l` | 切换上一个/下一个 Buffer |
| `Ctrl-w` | 关闭当前 Buffer |
| `<leader>bl` | 关闭右侧 Buffer |
| `<leader>bh` | 关闭左侧 Buffer |
| `<leader>bc` | 选择并关闭 Buffer |
| `Ctrl-p` | Telescope 查找文件 |
| `Ctrl-f` | Telescope 全局搜索 |
| `Alt-m` | 开关文件树 |

## Copilot / OpenCode

| 快捷键 | 作用 |
|---|---|
| `<leader>cp` | 打开 Copilot panel |
| `<leader>cc` | 打开/隐藏 Copilot CLI 悬浮终端 |
| `<leader>cl` | 打开/隐藏 Copilot 右侧终端 (35%) |
| `<leader>oc` | 打开/隐藏 OpenCode 悬浮终端 |
| `<leader>ol` | 打开/隐藏 OpenCode 右侧终端 (35%) |
| `<leader>ce` | 启用 Copilot |
| `<leader>cd` | 禁用 Copilot |

首次使用前执行 `:Copilot auth` 完成 GitHub 登录。

## Git 差分（gitsigns）

配置中已安装并启用 `lewis6991/gitsigns.nvim`，用于显示当前文件相对 Git 的增删改标记。

| 快捷键 | 作用 |
|---|---|
| `]c` | 跳到下一个变更块 |
| `[c` | 跳到上一个变更块 |
| `<leader>hs` | 暂存当前变更块 |
| `<leader>hr` | 重置当前变更块 |
| `<leader>hS` | 暂存当前文件 |
| `<leader>hR` | 重置当前文件 |
| `<leader>hp` | 预览当前变更块 |
| `<leader>hb` | 查看当前行 blame |
| `<leader>hd` | 查看当前文件 diff |
| `<leader>tb` | 开关当前行 blame |

## LSP 与诊断

| 快捷键 | 作用 |
|---|---|
| `gd` | 跳到定义 |
| `gh` | 查看悬浮文档 |
| `gD` | 跳到声明 |
| `gi` | 跳到实现 |
| `gr` | 查找引用 |
| `gp` | 打开当前诊断 |
| `gk/gj` | 上一个/下一个诊断 |
| `<leader>rn` | 重命名 |
| `<leader>ca` | 代码操作 |
| `<leader>f` | 格式化当前文件 |

## 编辑

| 快捷键 | 作用 |
|---|---|
| `Ctrl-j/k` | 上下移动四行 |
| `Ctrl-u/d` | 上下移动九行 |
| Visual `<`/`>` | 缩进后保持选中 |
| Visual `J/K` | 上下移动选中文本 |
| Visual `p` | 粘贴时不覆盖寄存器 |
| `q` | 退出当前窗口 |
| `qq` | 不保存退出当前窗口 |
| `Q` | 不保存退出 Neovim |

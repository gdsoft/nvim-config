local status, treesitter = pcall(require, "nvim-treesitter")
if not status then
  vim.notify("Not found nvim-treesitter!")
  return
end

treesitter.setup({
  ensure_installed = { "c", "rust", "lua", "vim", "vimdoc", "bash", "python", "json", "html", "markdown" },
  highlight = { enable = true },
  indent = { enable = true },
})

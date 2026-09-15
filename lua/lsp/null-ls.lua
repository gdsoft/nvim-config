local status, null_ls = pcall(require, "null-ls")
if not status then
  vim.notify("Not found none-ls!")
  return
end

local formatting = null_ls.builtins.formatting

null_ls.setup({
  debug = false,
  sources = {
    formatting.clang_format,
    formatting.stylua,
    formatting.shfmt,
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_buf_create_user_command(bufnr, "Format", function()
      vim.lsp.buf.format({ bufnr = bufnr })
    end, { desc = "Format current buffer" })
  end,
})

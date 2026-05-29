vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})

vim.diagnostic.config({
  virtual_lines = { only_current_line = true },
  virtual_text = false,
})


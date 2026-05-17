--vim.cmd("runtime plugin/lspconfig.lua")
vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})

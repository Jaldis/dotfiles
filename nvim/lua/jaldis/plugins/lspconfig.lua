vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})

function _G.lsp_attached()
  local clients = vim.lsp.buf_get_clients(0)
  if not next(clients) then return '' end
  local names = {}
  for _, client in pairs(clients) do
    table.insert(names, client.name)
  end
  return ' ' .. table.concat(names, ',')
end
vim.opt.statusline = "%f %m %=" .. "%{v:lua.lsp_attached()}" .. " %l:%c"

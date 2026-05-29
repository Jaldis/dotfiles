vim.api.nvim_create_user_command("LspInfo", "checkhealth vim.lsp", {})

vim.diagnostic.config({
    virtual_text = true,
    virtual_lines = false,
})

vim.lsp.config.gopls = {
    settings = {
        gopls = {
            gofumpt = true,
        },
    },
    on_attach = function(client, bufnr)
        -- Neovim buffer-local settings control tab width
        vim.bo[bufnr].tabstop = 4
        vim.bo[bufnr].shiftwidth = 4
        vim.bo[bufnr].expandtab = true
    end,
}
vim.lsp.enable("gopls")

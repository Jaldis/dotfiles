vim.keymap.set("n", "<leader>gs", "<cmd>Git<CR>", { desc = "Git status" })
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>", { desc = "Git commit" })
vim.keymap.set("n", "<leader>gC", "<cmd>Git commit --amend<CR>", { desc = "Git amend" })
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>", { desc = "Git push" })
vim.keymap.set("n", "<leader>gP", "<cmd>Git push --force-with-lease<CR>", { desc = "Git force push" })
vim.keymap.set("n", "<leader>gpl", "<cmd>Git pull<CR>", { desc = "Git pull" })
vim.keymap.set("n", "<leader>gF", "<cmd>Git fetch<CR>", { desc = "Git fetch" })
vim.keymap.set("n", "<leader>gd", "<cmd>Gdiffsplit<CR>", { desc = "Git diff" })
vim.keymap.set("n", "<leader>gD", "<cmd>Gvdiffsplit<CR>", { desc = "Git vertical diff" })
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<CR>", { desc = "Git blame" })
vim.keymap.set("n", "<leader>gB", "<cmd>Git branch<CR>", { desc = "Git branch" })
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<CR>", { desc = "Git log" })
vim.keymap.set("n", "<leader>gL", "<cmd>Git log --oneline<CR>", { desc = "Git log oneline" })
vim.keymap.set("n", "<leader>gst", "<cmd>Git stash<CR>", { desc = "Git stash" })
vim.keymap.set("n", "<leader>gsp", "<cmd>Git stash pop<CR>", { desc = "Git stash pop" })
vim.keymap.set("n", "<leader>gco", "<cmd>Git checkout<CR>", { desc = "Git checkout" })
vim.keymap.set("n", "<leader>gM", "<cmd>Git merge<CR>", { desc = "Git merge" })
vim.keymap.set("n", "<leader>gr", "<cmd>Git rebase<CR>", { desc = "Git rebase" })
vim.keymap.set("n", "<leader>gR", "<cmd>Git reset<CR>", { desc = "Git reset" })
vim.keymap.set("n", "<leader>ga", "<cmd>Git add %<CR>", { desc = "Git add file" })
vim.keymap.set("n", "<leader>gA", "<cmd>Git add .<CR>", { desc = "Git add all" })
vim.keymap.set("n", "<leader>g-", "<cmd>Gread<CR>", { desc = "Git restore file" })
vim.keymap.set("n", "<leader>g_", "<cmd>Gwrite<CR>", { desc = "Git stage file" })

local float_group = vim.api.nvim_create_augroup("FugitiveFloat", { clear = true })

local titles = {
    fugitive = " Git Status",
    fugitiveblame = " Git Blame",
    gitcommit = " Git Commit",
    gitrebase = " Git Rebase",
}

local function float_window()
    if vim.api.nvim_win_get_config(0).relative ~= "" then
        return
    end

    local buf = vim.api.nvim_get_current_buf()
    local orig_win = vim.api.nvim_get_current_win()
    local width = math.floor(vim.o.columns * 0.8)
    local height = math.floor(vim.o.lines * 0.8)
    local ft = vim.bo[buf].filetype

    vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = math.floor((vim.o.lines - height) / 2),
        col = math.floor((vim.o.columns - width) / 2),
        style = "minimal",
        border = "rounded",
        title = titles[ft] or " Git",
        title_pos = "center",
    })

    if vim.api.nvim_win_is_valid(orig_win) then
        vim.api.nvim_win_close(orig_win, true)
    end
end

vim.api.nvim_create_autocmd("FileType", {
    group = float_group,
    pattern = { "fugitive", "fugitiveblame", "gitcommit", "gitrebase" },
    callback = float_window,
})

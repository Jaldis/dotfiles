vim.g.copilot_enabled = false

vim.keymap.set("i", "<C-j>", function() vim.fn["copilot#Accept"]() end, { silent = true, desc = "Copilot accept" })
vim.keymap.set("n", "<leader>ct", "<cmd>Copilot toggle<CR>", { desc = "Toggle Copilot" })

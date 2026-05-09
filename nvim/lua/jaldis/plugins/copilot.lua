vim.keymap.set("i", "<C-j>", function() vim.fn["copilot#Accept"]() end, { silent = true, desc = "Copilot accept" })

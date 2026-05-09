-- Splits
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split vertical" })
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split horizontal" })
vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Equalize splits" })
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close split" })

-- Tabs
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "New tab" })
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close tab" })
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Next tab" })
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Previous tab" })

-- Navigation
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- File explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", { desc = "Open file explorer" })
vim.keymap.set("n", "Y", "0y$", { desc = "Yank the first character up to the last character" })






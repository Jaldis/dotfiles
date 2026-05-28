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

-- start and end of line navigation
--vim.keymap.set("n", "H", "^", { desc = "Yank the first character up to the last character" })
--vim.keymap.set("n", "L", "$", { desc = "Go to the first character of a line" })
vim.keymap.set("n", "Y", "^y$", { desc = "Copy the start of a non blank charater of a line up to the end of character of the line" })

-- Move highlighted text up/down in Visual mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move block down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move block up" })

vim.keymap.set("n", "<leader>li", vim.cmd.LspInfo, { desc = "LSP info" })

-- Navivation between split panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left split" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right split" })
vim.keymap.set("n", "<C-k>", "<C-k>", { desc = "Move to upper split" })
vim.keymap.set("n", "<C-j>", "<C-j>", { desc = "Move to lower split" })




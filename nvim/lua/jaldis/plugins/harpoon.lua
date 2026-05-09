local harpoon = require("harpoon")
harpoon.setup()

local wk = vim.keymap.set
wk("n", "<leader>a", function() harpoon:list():add() end, { desc = "Harpoon add file" })
wk("n", "<leader>h", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })
wk("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Harpoon select 1" })
wk("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Harpoon select 2" })
wk("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Harpoon select 3" })
wk("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Harpoon select 4" })

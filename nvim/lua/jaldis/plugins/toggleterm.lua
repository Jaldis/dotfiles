
require("toggleterm").setup({
	direction = "float",
    open_mapping = nil,
	hide_numbers = true,
	shade_filetypes = {},
	shade_terminals = true,
	shading_factor = "1",
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		winblend = 0,
		highlights = {
			border = "Normal",
			background = "Normal",
		},
	},
})

vim.keymap.set("n", "<leader>t", "<cmd>ToggleTerm<CR>", { noremap = true, silent = true })

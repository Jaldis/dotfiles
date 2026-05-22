local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
            },
        },
        preview = {
            -- enable preview window
            hide_on_startup = false,
        },
        prompt_prefix = "   ",
        selection_caret = "   ",
        entry_prefix = "  ",
        layout_strategy = "horizontal",
        layout_config = {
            horizontal = {
                prompt_position = "top",
                preview_width = 0.55,
            },
            vertical = {
                mirror = false,
            },
            width = 0.87,
            height = 0.80,
        },
    },
    pickers = {
        find_files = {
            previewer = true,
        },
        buffers = {
            previewer = true,
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
})

pcall(telescope.load_extension, "fzf")

local builtin = require("telescope.builtin")
local wk = vim.keymap.set
wk("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
wk("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
wk("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
wk("n", "<leader>fh", builtin.help_tags, { desc = "Find help tags" })
wk("n", "<leader>ft", builtin.treesitter, { desc = "Find treesitter" })
wk("n", "gp", builtin.lsp_definitions, { desc = "Peek definition" })

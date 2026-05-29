local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
                cond = function()
                    return vim.fn.executable("make") == 1
                end,
            },
        },
        config = function()
            require("jaldis.plugins.telescope")
        end,
    },
    {
        "ThePrimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("jaldis.plugins.harpoon")
        end,
    },
    {
        "tpope/vim-fugitive",
        config = function()
            require("jaldis.plugins.fugitive")
        end,
    },
    {
        "mbbill/undotree",
        config = function()
            require("jaldis.plugins.undotree")
        end,
    },
    {
        "github/copilot.vim",
        config = function()
            require("jaldis.plugins.copilot")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        config = function()
            require("jaldis.plugins.treesitter")
        end,
    },
    {
        "ray-x/lsp_signature.nvim",
        event = "VeryLazy",
        config = function()
            require("lsp_signature").setup({
                bind = true,
                handler_opts = {
                    border = "rounded",
                },
                hint_prefix = "",
                transparency = 15,
            })
        end,
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("jaldis.plugins.mason")
        end,
    },
    {
        "williamboman/mason-lspconfig.nvim",
        after = { "mason.nvim" },
    },
    {
        "neovim/nvim-lspconfig",
        lazy = false,
        config = function()
            require("jaldis.plugins.lspconfig")
        end,
    },
    {
        "L3MON4D3/LuaSnip",
        url = "https://github.com/L3MON4D3/LuaSnip.git",
        version = "v2.*",
        build = "make install_jsregexp",
        config = function()
            require("jaldis.plugins.luasnip")
        end,
    },
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "saadparwaiz1/cmp_luasnip",
        },
        config = function()
            require("jaldis.plugins.cmp")
        end,
    },
    {
        "Mofiqul/dracula.nvim",
        priority = 1000,
        config = function()
            require("jaldis.plugins.dracula")
        end,
    },
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("jaldis.plugins.toggleterm")
        end,
    },
    {
        "numToStr/Comment.nvim",
        config = function()
            require("jaldis.plugins.comment")
        end,
    }

})

require("nvim-treesitter.configs").setup({
	ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python", "bash", "markdown", "json", "c", "cpp", "rust", "zig", "go" },
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
    defaults = {
        preview = {
          treesitter = false,
    },
  },
})

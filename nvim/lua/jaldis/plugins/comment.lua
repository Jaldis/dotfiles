 require("Comment").setup({
      -- Optional: customize keymaps or behavior
  toggler = {
    line = "gcc",  -- toggle comment on current line
    block = "gbc", -- toggle block comment
  },
  opleader = {
    line = "gc",   -- comment with motion (gcw, gc$, etc.)
    block = "gb",  -- block comment with motion
  },
  extra = {
    above = "gcO", -- add comment above
    below = "gco", -- add comment below
    eol = "gcA",   -- add comment at end of line
  },
})

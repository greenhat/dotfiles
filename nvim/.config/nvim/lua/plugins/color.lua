return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          operators = false,
          strings = true,
          comments = true,
          folds = true,
          emphasis = true,
        },
        strikethrough = true,
        inverse = true, -- invert background for search, diffs, statuslines and errors
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        contrast = "hard", -- can be "hard" or "soft"
        overrides = {},
      })
      vim.o.background = "light"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}

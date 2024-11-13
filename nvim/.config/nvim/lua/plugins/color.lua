return {
  -- add gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    opts = {
      italic = {
        comments = false,
        strings = false,
      },
      -- inverse = true,
      contrast = "hard",
      overrides = {
        -- LspReferenceText = { fg = "#ebdbb2", bg = "#3c3836" },
        -- LspReferenceText = { link = "GruvboxOrangeBold" },
        -- you need to set LspReferenceRead and LspReferenceWrite
      },
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "day",
      styles = {
        comments = { italic = false },
        keywords = { italic = false },
        functions = {},
        variables = {},
      },
    },
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      colorscheme = "tokyonight",
    },
  },
}

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
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.g.zenbones_italic_comments = false
    end,
  },
  {
    "EdenEast/nightfox.nvim", -- lazy
  },
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_background = "hard"
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "gruvbox",
      --
      -- colorscheme = "gruvbox-material",
      --
      -- colorscheme = "tokyonight",
      --
      -- damn italics for types and constants
      -- colorscheme = "zenbones",
      --
      colorscheme = "dayfox",
    },
  },
}

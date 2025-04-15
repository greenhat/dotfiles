return {
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   opts = {
  --     italic = {
  --       comments = false,
  --       strings = false,
  --     },
  --     -- inverse = true,
  --     contrast = "hard",
  --     overrides = {
  --       -- LspReferenceText = { fg = "#ebdbb2", bg = "#3c3836" },
  --       -- LspReferenceText = { link = "GruvboxOrangeBold" },
  --       -- you need to set LspReferenceRead and LspReferenceWrite
  --     },
  --   },
  -- },
  -- {
  --   "folke/tokyonight.nvim",
  --   opts = {
  --     style = "day",
  --     styles = {
  --       comments = { italic = false },
  --       keywords = { italic = false },
  --       functions = {},
  --       variables = {},
  --     },
  --   },
  -- },
  {
    "zenbones-theme/zenbones.nvim",
    dependencies = "rktjmp/lush.nvim",
    config = function()
      vim.g.zenbones_italic_comments = false
      vim.g.zenbones_lightness = "bright"
      -- vim.g.zenbones_darken_non_text = 99
      -- vim.g.zenbones_darken_comments = 30
      vim.api.nvim_create_autocmd({ "ColorScheme" }, {
        pattern = "zenbones",
        callback = function()
          local lush = require("lush")
          local base = require("zenbones")
          local specs = lush.parse(function()
            return {
              Constant({ base.Constant, gui = "" }),
            }
          end)
          lush.apply(lush.compile(specs))
        end,
      })
    end,
  },
  {
    "EdenEast/nightfox.nvim",
    opts = {
      options = {
        inverse = {
          match_paren = false,
        },
      },
      palettes = {
        dayfox = {
          -- fg3 = "#d0d0d0", -- Line numbers, fold columns
        },
      },
    },
  },
  -- {
  --   "sainnhe/gruvbox-material",
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     -- Optionally configure and load the colorscheme
  --     -- directly inside the plugin declaration.
  --     vim.g.gruvbox_material_enable_italic = false
  --     vim.g.gruvbox_material_background = "hard"
  --   end,
  -- },

  {
    "miikanissi/modus-themes.nvim",
    priority = 1000,
    opts = {
      -- variant = "tinted",
      styles = {
        comments = { italic = true },
        keywords = { italic = false },
      },
    },
  },
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
      -- colorscheme = "dayfox",
      colorscheme = "modus_operandi",
    },
  },
}

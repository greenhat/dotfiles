return {
  {
    'zenbones-theme/zenbones.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    dependencies = 'rktjmp/lush.nvim',
    config = function()
      vim.g.zenbones_italic_comments = false
      vim.g.zenbones_lightness = 'bright'
      -- vim.g.zenbones_darken_non_text = 99
      -- vim.g.zenbones_darken_comments = 30
      vim.api.nvim_create_autocmd({ 'ColorScheme' }, {
        pattern = 'zenbones',
        callback = function()
          local lush = require 'lush'
          local base = require 'zenbones'
          local specs = lush.parse(function()
            return {
              ---@diagnostic disable-next-line: undefined-global
              Constant { base.Constant, gui = '' },
            }
          end)
          lush.apply(lush.compile(specs))
        end,
      })

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      vim.cmd.colorscheme 'zenbones'
    end,
  },
  -- {
  --   'ellisonleao/gruvbox.nvim',
  --   config = function()
  --     -- Default options:
  --     require('gruvbox').setup {
  --       terminal_colors = true, -- add neovim terminal colors
  --       undercurl = true,
  --       underline = true,
  --       bold = true,
  --       italic = {
  --         strings = true,
  --         emphasis = true,
  --         comments = false,
  --         operators = false,
  --         folds = true,
  --       },
  --       strikethrough = true,
  --       invert_selection = false,
  --       invert_signs = false,
  --       invert_tabline = false,
  --       inverse = false, -- invert background for search, diffs, statuslines and errors
  --       contrast = 'hard', -- can be "hard", "soft" or empty string
  --       palette_overrides = {},
  --       overrides = {},
  --       dim_inactive = false,
  --       transparent_mode = false,
  --     }
  --     vim.cmd 'colorscheme gruvbox'
  --   end,
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   config = function()
  --     vim.cmd 'colorscheme dayfox'
  --   end,
  -- },
}

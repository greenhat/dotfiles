return {
  "nvim-lualine/lualine.nvim",
  -- enabled = false,
  -- init = function()
  --   require("lualine").hide({
  --     place = { "statusline", "tabline" }, -- The segment this change applies to.
  --     unhide = false, -- whether to re-enable lualine again/
  --   })
  -- end,
  opts = function()
    local max_path_len = 100
    local opts = {
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          -- {
          --   "diagnostics",
          --   symbols = {
          --     error = LazyVim.config.icons.diagnostics.Error,
          --     warn = LazyVim.config.icons.diagnostics.Warn,
          --     info = LazyVim.config.icons.diagnostics.Info,
          --     hint = LazyVim.config.icons.diagnostics.Hint,
          --   },
          -- },
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- { LazyVim.lualine.pretty_path({ length = max_path_len }) },
        },

        lualine_x = {
          -- stylua: ignore
          -- {
          --   function() return require("noice").api.status.command.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
          --   color = function() return { fg = Snacks.util.color("Statement") } end,
          -- },
          -- -- stylua: ignore
          -- {
          --   function() return require("noice").api.status.mode.get() end,
          --   cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
          --   color = function() return { fg = Snacks.util.color("Constant") } end,
          -- },
        },
        lualine_y = {

          {
            "diagnostics",
            sources = { "nvim_workspace_diagnostic" },
            -- symbols = {
            --   error = icons.diagnostics.Error,
            --   warn = icons.diagnostics.Warn,
            --   info = icons.diagnostics.Info,
            --   hint = icons.diagnostics.Hint,
            -- },
          },
        },
        lualine_z = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      winbar = {
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- { LazyVim.lualine.pretty_path({ length = max_path_len }) },
        },
        lualine_x = {
          {
            "diagnostics",
            -- symbols = {
            --   error = LazyVim.config.icons.diagnostics.Error,
            --   warn = LazyVim.config.icons.diagnostics.Warn,
            --   info = LazyVim.config.icons.diagnostics.Info,
            --   hint = LazyVim.config.icons.diagnostics.Hint,
            -- },
          },
        },
        lualine_y = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
      inactive_winbar = {
        lualine_c = {
          -- LazyVim.lualine.root_dir(),
          -- { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          -- { LazyVim.lualine.pretty_path({ length = max_path_len }) },
        },
        lualine_x = {
          {
            "diagnostics",
            -- symbols = {
            --   error = LazyVim.config.icons.diagnostics.Error,
            --   warn = LazyVim.config.icons.diagnostics.Warn,
            --   info = LazyVim.config.icons.diagnostics.Info,
            --   hint = LazyVim.config.icons.diagnostics.Hint,
            -- },
          },
        },
        lualine_y = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
      },
    }
    return opts
  end,
}
-- vim: ts=2 sts=2 sw=2 et

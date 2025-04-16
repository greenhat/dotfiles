return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    command = "Hardtime",
    event = "BufEnter",
    -- "n" gets remapped
    -- keys = {
    --   { "n", "j", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "k", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "gj", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    --   { "n", "gk", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    -- },
  },
  {
    "akinsho/git-conflict.nvim",
    config = true,
  },
  {
    -- https://github.com/folke/lazy.nvim/discussions/463
    "glacambre/firenvim",
    -- cond = not not vim.g.started_by_firenvim,
    lazy = not vim.g.started_by_firenvim,
    module = false,
    build = function()
      vim.fn["firenvim#install"](0)
    end,
    -- DOES NOT WORK
    -- configure FireNvim here:
    -- config = function()
    --   vim.g.firenvim_config = {
    --     -- config values, like in my case:
    --     localSettings = {
    --       [".*"] = {
    --         takeover = "never",
    --       },
    --     },
    --   }
    -- end,
    { "noice.nvim", cond = not vim.g.started_by_firenvim },
    { "lualine.nvim", cond = not vim.g.started_by_firenvim }, -- not useful in the browser
  },
  {
    "alexghergh/nvim-tmux-navigation",
    lazy = false,
    -- config = function()
    --   local nvim_tmux_nav = require("nvim-tmux-navigation")
    --
    --   nvim_tmux_nav.setup({
    --     disable_when_zoomed = true, -- defaults to false
    --   })
    --
    --   vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    --   vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    --   vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    --   vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
    --   vim.keymap.set("n", "<C-\\>", nvim_tmux_nav.NvimTmuxNavigateLastActive)
    --   vim.keymap.set("n", "<C-Space>", nvim_tmux_nav.NvimTmuxNavigateNext)
    -- end,
    opts = {
      disable_when_zoomed = true,
    },
    keys = {
      {
        "<M-h>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateLeft()
        end,
        desc = "tmux nav left",
      },
      {
        "<M-j>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateDown()
        end,
        desc = "tmux nav down",
      },
      {
        "<M-k>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateUp()
        end,
        desc = "tmux nav up",
      },
      {
        "<M-l>",
        function()
          require("nvim-tmux-navigation").NvimTmuxNavigateRight()
        end,
        desc = "tmux nav right",
      },
    },
  },
}

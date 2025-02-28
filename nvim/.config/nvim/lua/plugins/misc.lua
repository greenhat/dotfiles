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
}

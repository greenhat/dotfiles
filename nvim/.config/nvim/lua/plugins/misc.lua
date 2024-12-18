return {
  {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
    command = "Hardtime",
    event = "BufEnter",
    keys = {
      { "n", "j", "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "k", "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "gj", "<cmd>Hardtime<CR>", desc = "Hardtime" },
      { "n", "gk", "<cmd>Hardtime<CR>", desc = "Hardtime" },
    },
  },
}

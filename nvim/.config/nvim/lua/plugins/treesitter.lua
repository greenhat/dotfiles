return {
  "nvim-treesitter/nvim-treesitter",
  keys = {
    { "L", desc = "Increment Selection" },
    { "<bs>", desc = "Decrement Selection", mode = "x" },
  },
  ---@type TSConfig
  ---@diagnostic disable-next-line: missing-fields
  opts = {
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "L",
        node_incremental = "L",
        scope_incremental = false,
        node_decremental = "<bs>",
      },
    },
  },
}

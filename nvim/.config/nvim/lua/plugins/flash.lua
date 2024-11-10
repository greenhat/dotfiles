return {
  "folke/flash.nvim",
  opts = {
    labels = "arstneioqwfpluy;",
    search = {
      multi_window = false,
      mode = function(str)
        return "\\<" .. str
      end,
    },
  },
}

return {
  "folke/flash.nvim",
  opts = {
    labels = "arstneioqwfpluy;zxcdh,./",
    search = {
      multi_window = false,
      mode = function(str)
        return "\\<" .. str
      end,
    },
    highlight = {
      groups = {
        label = "FlashCurrent",
      },
    },
  },
}

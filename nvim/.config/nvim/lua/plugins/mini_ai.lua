return {
  "echasnovski/mini.ai",
  opts = {
    custom_textobjects = {
      s = require("mini.ai").gen_spec.treesitter({ i = "@statement.outer", a = "@statement.outer" }),
    },
  },
}

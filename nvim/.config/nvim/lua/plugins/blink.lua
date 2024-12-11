return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      menu = {
        auto_show = false,
      },
    },
    keymap = {
      -- preset = "default",

      ["<C-e>"] = { "show", "show_documentation", "hide_documentation" },
      -- accept word
      ["<M-Tab>"] = {
        function()
          if require("copilot.suggestion").is_visible() then
            LazyVim.create_undo()
            require("copilot.suggestion").accept_word()
            return true
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
  },
}

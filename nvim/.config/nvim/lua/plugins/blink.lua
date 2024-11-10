return {
  "saghen/blink.cmp",
  opts = {
    windows = {
      ghost_text = {
        enabled = false,
      },
    },
    keymap = {
      ["<Tab>"] = {
        function(cmp)
          if cmp.is_in_snippet() then
            return cmp.accept()
          elseif require("copilot.suggestion").is_visible() then
            LazyVim.create_undo()
            require("copilot.suggestion").accept()
            return true
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
      -- accept word
      ["<M-Tab>"] = {
        function(cmp)
          if cmp.is_in_snippet() then
            return cmp.accept()
          elseif require("copilot.suggestion").is_visible() then
            LazyVim.create_undo()
            require("copilot.suggestion").accept_word()
            return true
          else
            return cmp.select_and_accept()
          end
        end,
        "snippet_forward",
        "fallback",
      },
    },
  },
}

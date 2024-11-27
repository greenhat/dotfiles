return {
  "saghen/blink.cmp",
  opts = {
    -- trigger = {
    --   completion = {
    --     -- LSPs can indicate when to show the completion window via trigger characters
    --     -- however, some LSPs (i.e. tsserver) return characters that would essentially
    --     -- always show the window. We block these by default
    --     blocked_trigger_characters = { " ", "\n", "\t", "." },
    --     -- when true, will show the completion window when the cursor comes after a trigger character after accepting an item
    --     show_on_accept_on_trigger_character = false,
    --     -- when true, will show the completion window when the cursor comes after a trigger character when entering insert mode
    --     show_on_insert_on_trigger_character = false,
    --     -- list of additional trigger characters that won't trigger the completion window when the cursor comes after a trigger character when entering insert mode/accepting an item
    --     show_on_x_blocked_trigger_characters = { "'", '"', "(" },
    --     -- when false, will not show the completion window automatically when in a snippet
    --     show_in_snippet = false,
    --   },
    -- },
    windows = {
      ghost_text = {
        enabled = false,
      },
      autocomplete = {
        auto_show = false,
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

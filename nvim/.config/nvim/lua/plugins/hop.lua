return {
  'phaazon/hop.nvim',
  config = function()
    local hop = require('hop')
    hop.setup()

    local directions = require('hop.hint').HintDirection
    vim.keymap.set('n', 's',
      function()
        hop.hint_words({ direction = directions.AFTER_CURSOR })
        -- hop.hint_char2({ direction = directions.AFTER_CURSOR })
      end,
      { remap = true, desc = 'Hop to word forward' })

    vim.keymap.set('n', 'S',
      function()
        hop.hint_words({ direction = directions.BEFORE_CURSOR })
        -- hop.hint_char2({ direction = directions.BEFORE_CURSOR })
      end,
      { remap = true, desc = 'Hop to word backword' })

    -- vim.keymap.set('', 'F', function()
    --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
    -- end, { remap = true })
    -- vim.keymap.set('', 't', function()
    --   hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
    -- end, { remap = true })
    -- vim.keymap.set('', 'T', function()
    --   hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
    -- end, { remap = true })
  end
}

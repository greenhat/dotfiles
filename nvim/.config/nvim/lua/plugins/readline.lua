return {
  'assistcontrol/readline.nvim',
  config = function()
    local readline = require 'readline'
    vim.keymap.set('!', '<M-f>', readline.forward_word)
    vim.keymap.set('!', '<M-b>', readline.backward_word)
    vim.keymap.set('!', '<C-a>', readline.beginning_of_line)
    vim.keymap.set('!', '<C-e>', readline.end_of_line)
    vim.keymap.set('!', '<M-d>', readline.kill_word)
    vim.keymap.set('!', '<M-BS>', readline.backward_kill_word)
  end
}

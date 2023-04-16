return {
  'ruanyl/vim-gh-line',

  config = function ()
    -- Copy link to a clipboard instead of opening a browser:
    vim.g.gh_open_command = 'fn() { echo "$@" | tee >(wl-copy) >(tmux loadb -); }; fn '
  end
}

typeset -U PATH path
# path=("$HOME/.local/bin" /other/things/in/path "$path[@]")
path=("$HOME/.local/bin" "$path[@]")
export PATH

export EDITOR=nvim
export BROWSER=/usr/bin/brave

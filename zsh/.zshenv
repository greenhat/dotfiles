typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
path=("$HOME/bin" "$path[@]")
path=("/usr/local/sbin" "$path[@]") # brew
path=("$HOME/.cargo/bin" "$path[@]") # rust
export PATH

export EDITOR=nvim
export BROWSER=/usr/bin/brave
export TERM=xterm
export XCOMPOSEFILE=/tmp/compose
export SHELL=/bin/zsh
export GPG_TTY=$(tty)

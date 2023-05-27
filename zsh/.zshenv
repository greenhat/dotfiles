typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
path=("$HOME/bin" "$path[@]")
path=("/usr/local/sbin" "$path[@]") # brew
path=("$HOME/.cargo/bin" "$path[@]") # rust
path=("$HOME/.local/share/coursier/bin" "$path[@]") # rust
export PATH
export PATH="$PATH:$(go env GOBIN):$(go env GOPATH)/bin"

export EDITOR=nvim
export VISUAL=nvim
export BROWSER=/usr/bin/microsoft-edge-stable
# export TERM=tmux-256color
export TERM=xterm-256color
export XCOMPOSEFILE=/tmp/compose
# export SHELL=/bin/zsh
# export GPG_TTY=$(tty)
export CLICOLOR=1
export BAT_THEME="GitHub"
# . "$HOME/.cargo/env"

# export LANGUAGE=en_US.UTF-8
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8
# export LC_TYPE=en_US.UTF-8

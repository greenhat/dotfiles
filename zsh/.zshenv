typeset -U PATH path
path=("$HOME/.local/bin" "$path[@]")
path=("$HOME/bin" "$path[@]")
path=("/usr/local/sbin" "$path[@]") # brew
path=("$HOME/.cargo/bin" "$path[@]") # rust
path=("/Applications/Visual Studio Code.app/Contents/Resources/app/bin" "$path[@]") # vscode's code
export PATH

export EDITOR=zed
export VISUAL=zed
# export TERM=tmux-256color
export TERM=xterm-256color
export XCOMPOSEFILE=/tmp/compose
export CLICOLOR=1
export BAT_THEME="GitHub"

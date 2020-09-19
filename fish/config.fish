set -x PATH "/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
set -x PATH $PATH "/Applications"
set -x PATH $PATH "/Users/green/.local/bin"

alias vim=nvim

set -x VISUAL "nvim"
set -x EDITOR "$VISUAL"
set -x SHELL "fish"

# set ergo_compiler_macro_log "true"

git config --global alias.co "checkout"
git config --global alias.br "branch"
git config --global alias.cm "commit"
git config --global alias.st "status"

# fish_vi_key_bindings
fish_default_key_bindings

set -x PATH $PATH "$HOME/.bloop"

# source ~/.ghcup/env

set -x BAT_THEME "GitHub"
alias cat=bat

set -x PATH $PATH "$HOME/.cargo/bin"

set -x RUST_BACKTRACE 1

# tmux pane pwd
function cdp
    # from upper pane
    set tmuxpanedirname (tmux display-message -p -F "#{pane_current_path}" -t0) && cd $tmuxpanedirname
end

function cdpd
    # from lower pane
    set tmuxpanedirname (tmux display-message -p -F "#{pane_current_path}" -t1) && cd $tmuxpanedirname
end

function jdk 
    set jdkversion $argv
    set -x JAVA_HOME (/usr/libexec/java_home -v "$jdkversion")
    java -version
 end

 # default JDK
 jdk 11 2> /dev/null

set -x SBT_OPTS "-Xmx3000M -Xss4m -XX:ReservedCodeCacheSize=384m"
set -x QMK_HOME "$HOME/code/my/qmk_firmware"
set -x LEDGER_FILE "$HOME/Documents/ledger/2020.ledger"
set -x PATH $PATH "/Users/green/Library/Application Support/Coursier/bin"
set -x ANDROID_SDK_ROOT "$HOME/Library/Android/sdk"
set -x PATH $PATH "$HOME/.emacs.d/bin"

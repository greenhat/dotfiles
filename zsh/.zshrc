# https://github.com/mattmc3/zsh_unplugged
# clone a plugin, find an init.zsh, source it, and add it to your fpath
function plugin-load () {
  local giturl="$1"
  local plugin_name=${${giturl##*/}%.git}
  local plugindir="${ZPLUGINDIR:-$HOME/.zsh/plugins}/$plugin_name"

  # clone if the plugin isn't there already
  if [[ ! -d $plugindir ]]; then
    command git clone --depth 1 --recursive --shallow-submodules $giturl $plugindir
    if [[ $? -ne 0 ]]; then
      echo "plugin-load: git clone failed for: $giturl" >&2 && return 1
    fi
  fi

  # symlink an init.zsh if there isn't one so the plugin is easy to source
  if [[ ! -f $plugindir/init.zsh ]]; then
    local initfiles=(
      # look for specific files first
      $plugindir/$plugin_name.plugin.zsh(N)
      $plugindir/$plugin_name.zsh(N)
      $plugindir/$plugin_name(N)
      $plugindir/$plugin_name.zsh-theme(N)
      # then do more aggressive globbing
      $plugindir/*.plugin.zsh(N)
      $plugindir/*.zsh(N)
      $plugindir/*.zsh-theme(N)
      $plugindir/*.sh(N)
    )
    if [[ ${#initfiles[@]} -eq 0 ]]; then
      echo "plugin-load: no plugin init file found" >&2 && return 1
    fi
    command ln -s ${initfiles[1]} $plugindir/init.zsh
  fi

  # source the plugin
  source $plugindir/init.zsh

  # modify fpath
  fpath+=$plugindir
  [[ -d $plugindir/functions ]] && fpath+=$plugindir/functions
}

# set where we should store Zsh plugins
ZPLUGINDIR=$HOME/.zsh/plugins

# add your plugins to this list
plugins=(
  # core plugins
  zsh-users/zsh-autosuggestions
  zsh-users/zsh-history-substring-search

  # load this one last
  zsh-users/zsh-syntax-highlighting
)

# load your plugins (clone, source, and add to fpath)
for repo in $plugins; do
  plugin-load https://github.com/${repo}.git
done
unset repo

# eval "$(github-copilot-cli alias -- "$0")"

# Lines configured by zsh-newuser-install
HISTFILE=~/.zhistory
HISTSIZE=100000
SAVEHIST=100000
# setopt INC_APPEND_HISTORY_TIME  # append command to history file immediately after execution

# as each line is added, the history file is checked to see if anything was written out by another shell, 
# and if so it is included in the history of the current shell too. This means that zsh's 
# running in different windows but on the same host (or more generally with the same home directory) share the same history.
# setopt SHARE_HISTORY  # End of lines configured by zsh-newuser-install

# setopt    APPEND_HISTORY     #Append history to the history file (no overwriting)
setopt    SHARE_HISTORY      #Share history across terminals
setopt    INC_APPEND_HISTORY  #Immediately append to the history file, not just when a term is killed

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/green/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

host=$( hostname )

# emacs key-bindings
bindkey -e

bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

# # Load version control information
# autoload -Uz vcs_info

# # via https://stackoverflow.com/questions/59009508/how-to-only-show-current-folder-and-git-branch-and-for-home-in-zsh
# # format vcs_info variable
# zstyle ':vcs_info:git:*' formats ':%F{green}%b%f'

# Set up the prompt
setopt PROMPT_SUBST
PROMPT='%F{blue}%m %~%f $ '

# delete key
bindkey  "^[[3~"  delete-char

# Z 
# [[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

# alias dc='docker-compose'
# alias pm='sudo pacman'
# alias vim='nvim'
# image viewer
alias icat="kitty +kitten icat"

# set title bar in the terminal to "[command] pwd"
case $TERM in
    *xterm*|rxvt|(dt|k|E)term)
        precmd () {
            # vcs_info
            print -Pn "\033]0;%~\007"
        }
        # preexec () {
        #     print -Pn "\033]0;<$1> %~\007"
        # }
        ;;
esac
#
# # FZF
# # fedora 
# if [[ -f /usr/share/fzf/shell/key-bindings.zsh ]]; then
#     source /usr/share/fzf/shell/key-bindings.zsh
# fi
# # fedora 
# if [[ -f /usr/share/fzf/shell/completion.zsh ]]; then
#     source /usr/share/fzf/shell/completion.zsh
# fi
#
# # debian
# if [[ -f /usr/share/doc/fzf/examples/key-bindings.zsh ]]; then
#     source /usr/share/doc/fzf/examples/key-bindings.zsh
# fi
# # debian
# if [[ -f /usr/share/doc/fzf/examples/completion.zsh ]]; then
#     source /usr/share/doc/fzf/examples/completion.zsh
# fi

export FZF_DEFAULT_OPTS='--layout=reverse'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_OPTS="--preview 'batcat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# Set up fzf key bindings and fuzzy completion (fzf 0.48.0 or later)
source <(fzf --zsh)

# alias pi="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
# alias pd="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

# export RUST_BACKTRACE=1

# export MANPAGER='nvim +Man!'
export MANWIDTH=999

alias rng='TERM=xterm-kitty ranger'
alias tmux='tmux -u'
alias vi='NVIM_APPNAME="nvim-kickstart" nvim'

# Set cursor style for tmux
# CSI Ps SP q
#           Set cursor style (DECSCUSR, VT520).
#             Ps = 0  -> blinking block.
#             Ps = 1  -> blinking block (default).
#             Ps = 2  -> steady block.
#             Ps = 3  -> blinking underline.
#             Ps = 4  -> steady underline.
#             Ps = 5  -> blinking bar (xterm).
#             Ps = 6  -> steady bar (xterm).
printf '\033[6 q'

# edit command line in your editor
# https://unix.stackexchange.com/questions/6620/how-to-edit-command-line-in-full-screen-editor-in-zsh
autoload -z edit-command-line
zle -N edit-command-line
bindkey "^X^E" edit-command-line

source $HOME/.secrets

fixssh() {
  eval $(tmux show-environment -s | grep '^SSH_AUTH_SOCK')
}

eval "$(starship init zsh)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias claude="/Users/green/.claude/local/claude"

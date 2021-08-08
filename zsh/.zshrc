# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/green/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# Fish-like syntax highlighting and autosuggestions
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# History search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
bindkey "^[[A" history-substring-search-up
bindkey "^[[B" history-substring-search-down

# Load version control information
autoload -Uz vcs_info

# via https://stackoverflow.com/questions/59009508/how-to-only-show-current-folder-and-git-branch-and-for-home-in-zsh
# format vcs_info variable
zstyle ':vcs_info:git:*' formats ':%F{green}%b%f'
# zstyle ':vcs_info:git:*' formats '%b'

# Set up the prompt
setopt PROMPT_SUBST
# PROMPT='%1~ %F{green}${vcs_info_msg_0_}%f $ '
PROMPT='%F{blue}%1~%f${vcs_info_msg_0_} $ '

# delete key
bindkey  "^[[3~"  delete-char

# Z 
[[ -r "/usr/share/z/z.sh" ]] && source /usr/share/z/z.sh

alias dc='docker-compose'
alias pm='sudo pacman'
alias vim='nvim'
# image viewer
alias icat="kitty +kitten icat"

# set title bar in the terminal to "[command] pwd"
case $TERM in
    *xterm*|rxvt|(dt|k|E)term)
        precmd () {
            vcs_info
            print -Pn "\033]0;%~\007"
        }
        preexec () {
            print -Pn "\033]0;<$1> %~\007"
        }
        ;;
esac

# FZF
source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

export FZF_DEFAULT_OPTS='--layout=reverse'
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

alias pi="pacman -Slq | fzf --multi --preview 'pacman -Si {1}' | xargs -ro sudo pacman -S"
alias pd="pacman -Qq | fzf --multi --preview 'pacman -Qi {1}' | xargs -ro sudo pacman -Rns"

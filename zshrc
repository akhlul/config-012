# --------------------
# Initialize sane opts
# --------------------

setopt CORRECT
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# sane opts from zimfw
setopt HIST_IGNORE_ALL_DUPS
bindkey -e
#setopt CORRECT
#SPROMPT='zsh: correct %F{red}%R%f to %F{green}%r%f [nyae]? '
WORDCHARS=${WORDCHARS//[\/]}

# git
#zstyle ':zim:git' aliases-prefix 'g'

# input
#zstyle ':zim:input' double-dot-expand yes

# termtitle
#zstyle ':zim:termtitle' format '%1~'

# zsh-autosuggestions
ZSH_AUTOSUGGEST_MANUAL_REBIND=1
#ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=242'

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets)
#typeset -A ZSH_HIGHLIGHT_STYLES
#ZSH_HIGHLIGHT_STYLES[comment]='fg=242'


# ------------------
# Initialize modules
# ------------------

ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim
# Download zimfw plugin manager if missing.
if [[ ! -e ${ZIM_HOME}/zimfw.zsh ]]; then
  if (( ${+commands[curl]} )); then
    curl -fsSL --create-dirs -o ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  else
    mkdir -p ${ZIM_HOME} && wget -nv -O ${ZIM_HOME}/zimfw.zsh \
        https://github.com/zimfw/zimfw/releases/latest/download/zimfw.zsh
  fi
fi
# Install missing modules, and update ${ZIM_HOME}/init.zsh if missing or outdated.
if [[ ! ${ZIM_HOME}/init.zsh -nt ${ZIM_CONFIG_FILE:-${ZDOTDIR:-${HOME}}/.zimrc} ]]; then
  source ${ZIM_HOME}/zimfw.zsh init
fi
# Initialize modules.
source ${ZIM_HOME}/init.zsh
# }}} End configuration added by Zim Framework install


# ------------------
# binaries & aliases
# ------------------

if [ -d "$HOME/.local/bin" ]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME/.bun/bin" ]; then
  export PATH="/home/karom/.bun/bin:$PATH"
fi

if [ -f ~/.zsh_aliases ]; then
  source ~/.zsh_aliases
fi

# PROMPT='%F{green}%n@%m%f:%F{blue}%~%f$(parse_git_branch)$ '

# ## PLUGINS AND KEYBINDINGS
# if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
#   source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
# fi
#
# if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
#   source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# fi
#

# ---------------
# everything else
# ---------------

eval "$(~/.local/bin/mise activate zsh)"

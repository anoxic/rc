# .zshrc for brian
. $HOME/.profile


export EDITOR='vim'
export GIT_EDITOR='vim'

# ------------------------
# Prompt
# ------------------------

# Vim Editing Mode
bindkey -v

# Initialize colors.
autoload -U colors
colors
 
# Allow for functions in the prompt.
setopt PROMPT_SUBST
 
# Autoload zsh functions.
fpath=(~/.zsh/functions $fpath)
autoload -U ~/.zsh/functions/*(:t)
 
# Enable auto-execution of functions.
typeset -ga preexec_functions
typeset -ga precmd_functions
typeset -ga chpwd_functions
 
# Append git functions needed for prompt.
preexec_functions+='preexec_update_git_vars'
precmd_functions+='precmd_update_git_vars'
chpwd_functions+='chpwd_update_git_vars'
 
# Set the prompt.
PROMPT=$'%{${fg[cyan]}%}%B%~%b$(prompt_git_info)%{${fg[default]}%} '


# ------------------------
# Title
# ------------------------
precmd_set_title() {
	[[ -t 1 ]] || return
	case $TERM in
		sun-cmd) print -Pn "\e]l%n@%m: %~\e\\" ;;
		*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%n@%m: %~\a" ;;
		screen*) print -Pn "\e_%n@%m: %~\e\\" ;;
	esac
}
typeset -ga precmd_set_title
precmd_functions+='precmd_set_title'


# ------------------------
# zsh-specific aliases
# ------------------------
alias history='<$HOME/.zsh_history | grep'

# ------------------------
# Shell history
# ------------------------
setopt share_history
HISTFILE=$HOME/.zsh_history
HISTSIZE=7777
SAVEHIST=7777

# ------------------------
# Misc settings
# ------------------------
setopt autocd beep nomatch
unsetopt notify

# ------------------------
# syntax-hightlighting
# ------------------------
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

PATH=$PATH:$HOME//.rvm/bin # Add RVM to PATH for scripting

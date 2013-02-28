# .zshrc for brian
. $HOME/.profile


export EDITOR='vim'
export GIT_EDITOR='vim'

# ------------------------
# Prompt
# ------------------------

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

comment() {
    autoload -U colors; colors; setopt prompt_subst
    PROMPT=$'%{$fg_bold[red]%}✄  %{$reset_color%}' 

    # Display git branch on rprompt
    typeset -ga precmd_functions
    precmd_functions+='update_git_branch_prompt'
    update_git_branch_prompt() {
        RPROMPT=$(git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')
    }
}

# ------------------------
# Title
# ------------------------
set_title() {
	[[ -t 1 ]] || return
	case $TERM in
		sun-cmd) print -Pn "\e]l%n@%m: %~\e\\" ;;
		*xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%n@%m: %~\a" ;;
		screen*) print -Pn "\e_%n@%m: %~\e\\" ;;
	esac
}                                                                         
precmd() {
	set_title
}

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
bindkey -e

# ------------------------
# syntax-hightlighting
# ------------------------
source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ------------------------
# Mouse placement
# ------------------------
. $HOME/.zsh/mouse.zsh
zle-toggle-mouse

cd $HOME


# Aliases:
# --------
alias ls='ls -F --color=auto'
alias ll='ls -lh'


# Set terminal type:
# ------------------
export TERM=xterm-256color


# ANSI color codes:
# -----------------
# Regular
Red="\[\033[0;31m\]"
Green="\[\033[0;32m\]"
Yellow="\[\033[0;33m\]"
Blue="\[\033[0;34m\]"
Purple="\[\033[0;35m\]"
Cyan="\[\033[0;36m\]"
Gray="\[\033[1;30m\]"

# Bold
BRed="\[\033[1;31m\]"
BGreen="\[\033[1;32m\]"
BYellow="\[\033[1;33m\]"
BBlue="\[\033[1;34m\]"
BPurple="\[\033[1;35m\]"
BCyan="\[\033[1;36m\]"
BGray="\[\033[1;37m\]"

# Turn off colors
Color_Off="\[\033[0m\]"


# Set up command prompt:
# ----------------------
# Source git scripts
# curl https://github.com/git/git/raw/master/contrib/completion/git-completion.bash -OL
# curl https://github.com/git/git/raw/master/contrib/completion/git-prompt.sh -OL
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh

function __prompt_command()
{
    # Basic information (user@host pwd)
    # PS1+="${Green}\u@\h ${Yellow}\w ${Color_Off}"
    PS1="${Cyan}\u@\h ${Yellow}\w${Color_Off}"


    # If in a git repo, output git status information
    local git_status="`git status -unormal 2>&1`"
    if ! [[ "$git_status" =~ Not\ a\ git\ repo ]]; then
        # Parse the porcelain output of git status
        if [[ "$git_status" =~ nothing\ to\ commit ]]; then
            local Color_On=${BGreen}
        elif [[ "$git_status" =~ nothing\ added\ to\ commit\ but\ untracked\ files\ present ]]; then
            local Color_On=${BPurple}
        elif [[ "$git_status" =~ Changes\ to\ be\ committed ]]; then
            local Color_On=${BYellow}
        else
            local Color_On=${BRed}
        fi

        # git-prompt.sh is required to use `__git_ps1`
        branch=$(__git_ps1)

        PS1+="${Color_On}$branch${Color_Off}"
    fi


    PS1+="\n\$ "
}

PROMPT_COMMAND=__prompt_command

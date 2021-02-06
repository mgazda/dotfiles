#!/usr/bin/env bash

# COLORS

beige="\033[38;5;229m"
blue="\033[38;5;66m"
default="\033[0m"
gray="\033[90m"
green="\033[38;5;34m"
greenish="\033[38;5;148m"
orange="\033[38;5;130m"
red="\033[38;5;160m"
yellow="\033[38;5;226m"


# GIT STUFF FOR PROMPT

function git_status() {
    local statline=$(git status --porcelain --branch 2> /dev/null |
                     awk ' BEGIN { modified = 0; untracked = 0; conflicts = 0; ahead = "" }

                          /^##.*\[ahead .+\]/  { sub(/## /, ""); sub(/\.\.\..*/, ""); branch = $0; ahead = "↑"; }
                          /^##.*\[behind .+\]/ { sub(/## /, ""); sub(/\.\.\..*/, ""); branch = $0; ahead = "↓"; }

                          /^##/                { sub(/## /, ""); sub(/\.\.\..*/, ""); branch = $0; }

                          /^.?(M|D|A)/ { modified += 1 }

                          /^\?\?/ { untracked += 1 }

                          /^.?U/ { conflicts += 1 }

                          END   { printf "%s;%s;%d;%d;%d", branch, ahead, modified, untracked, conflicts }
                     ')

    IFS=';' read -a status <<< "${statline}"

    local branch=${status[0]}
    local ahead=${status[1]}
    local modified=${status[2]}
    local untracked=${status[3]}
    local conflicts=${status[4]}

    if [[ "$branch" == "" ]]; then
        echo -n ""
    else
        echo -en "${beige} ("
        echo -en ${branch}
        echo -en ${ahead}
        if [[ "$modified" != "0" ]]; then
            echo -en "|${green}${modified}"
        fi
        if [[ "$untracked" != "0" ]]; then
            echo -en "${beige}|${yellow}${untracked}"
        fi
        if [[ "$conflicts" != "0" ]]; then
            echo -en "${beige}|${red}${conflicts}"
        fi
        echo -en "${beige})"
    fi
}


# PROMPT

PS1=""
PS1+="\[${greenish}\]\u"                            # user
PS1+="\[${orange}\]@\h"                             # at
PS1+="\[${default}\] : "                            # separator
PS1+="\[${blue}\]\w"                                # working dir
PS1+="\$(git_status)"                               # git status
PS1+=$'\n'                                           # new line
PS1+="\[${gray}\][\t] "                             # time
PS1+="\[${default}\]\$ "                            # $ and space

export PS1


# COLORS FOR LS

case "$OSTYPE" in
    darwin*)
        alias ls="ls -G"
        LSCOLORS="gxfxcxdxbxagadabagacad"
        export LSCOLORS
        ;;
    linux*)
        alias ls="ls --color"
        LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=30;46:cd=30;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
        export LS_COLORS
        ;;
    msys*)
        alias ls="ls --color"
        LS_COLORS="di=36:ln=35:so=32:pi=33:ex=31:bd=30;46:cd=30;43:su=30;41:sg=30;46:tw=30;42:ow=30;43"
        export LS_COLORS
        ;;
esac


# VIM STUFF

export VISUAL="/usr/bin/vim"
export EDITOR="$VISUAL"

set -o vi


# PATH

case "$OSTYPE" in
    darwin*)
        export PATH=$PATH:~/Scripts:/usr/local/share/npm/bin:/usr/games/bin
        ;;
    linux*)
        export PATH=$PATH:~/.local/bin
        ;;
esac

# SDKMAN (if exists)
if [ -d "$HOME/.sdkman" ]; then
    export SDKMAN_DIR="$HOME/.sdkman"
    [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
fi

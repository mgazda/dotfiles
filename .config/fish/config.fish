set -x EDITOR 'nvim'
set -x TERM 'xterm-256color'

fish_vi_key_bindings

### Autocomplete and highlight colors
# set fish_color_normal brcyan
set fish_color_autosuggestion '#928374'
set fish_color_command '#076678'
# set fish_color_error '#ff6c6b'
set fish_color_param '#458588'

### Remove background from Windows folders
set -x LS_COLORS 'ow=34'

### set PATH so it includes user's private bin if it exists
if test -d $HOME/.local/bin
    set -x PATH $HOME/.local/bin $PATH
end

### do the same for Homebrew's bin dir on apple silicon
if test -d /opt/homebrew/bin
    set -x PATH /opt/homebrew/bin $PATH
end

### Use nvim instead of vim
alias vim=nvim

### 'Bare git repo for dotfiles'
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### After quitting ranger stay in its current directory
alias ranger='ranger --choosedir=$HOME/.rangerdir; cd (cat $HOME/.rangerdir)'

### Launch starship prompt
starship init fish | source

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

### Setup Java
set -x JAVA_HOME /opt/homebrew/opt/openjdk@11
fish_add_path $JAVA_HOME/bin

### Show system info
if which neofetch > /dev/null
  neofetch
end

### Add rust to the path
fish_add_path /Users/wizz/.cargo/bin

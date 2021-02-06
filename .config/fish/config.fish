set -x EDITOR 'nvim'
set -x TERM 'xterm-256color'

fish_vi_key_bindings

# Remove background from Windows folders
set -x LS_COLORS 'ow=34'

# set PATH so it includes user's private bin if it exists
if test -d $HOME/.local/bin
    set -x PATH "$HOME/.local/bin:$PATH"
end

# 'Bare git repo for dotfiles'
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# Launch starship prompt
starship init fish | source

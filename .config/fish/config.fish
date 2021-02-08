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
    set -x PATH "$HOME/.local/bin:$PATH"
end

### 'Bare git repo for dotfiles'
alias config='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

### Launch starship prompt
starship init fish | source

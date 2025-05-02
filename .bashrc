export BASH_SILENCE_DEPRECATION_WARNING=1
export OBJC_DISABLE_INITIALIZE_FORK_SAFETY=YES
export EDITOR=vim
export XDG_CONFIG_HOME="$HOME/.config"
export LANG=en_US.UTF-8

# bash vim mode
set -o vi

# prompt and colors
alias ls='ls --color=auto'
export STARSHIP_CONFIG="$HOME/.config/coderv2/dotfiles/.starship.toml"
eval "$(starship init bash)"

# fzf
eval "$(fzf --bash)"
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1e1e2e,spinner:#f5e0dc,hl:#f38ba8 \
--color=fg:#cdd6f4,header:#f38ba8,info:#cba6f7,pointer:#f5e0dc \
--color=marker:#f5e0dc,fg+:#cdd6f4,prompt:#cba6f7,hl+:#f38ba8"

# bash completion
source /usr/share/bash-completion/completions/git
source /etc/bash_completion.d/gcloud
source /usr/share/bash-completion/completions/docker
eval "$(gh completion -s bash)"

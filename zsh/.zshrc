plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  )
source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------

[ -f $XDG_CONFIG_HOME/zsh/source-file/pyenv.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/pyenv.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/nvm.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/nvm.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/sdkman.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/sdkman.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/rbenv.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/rbenv.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/exa.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/exa.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/fzf.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/fzf.zsh
[ -f $XDG_CONFIG_HOME/zsh/source-file/lvim.zsh ] && source $XDG_CONFIG_HOME/zsh/source-file/lvim.zsh
# source ~/.config/lf/lf.zsh

# -------------------------------------------------------

eval "$(starship init zsh)" # starship
eval "$(zoxide init zsh)" # zoxide

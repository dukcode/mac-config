plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  )
source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------

source ~/.config/zsh/source-file/pyenv.zsh
source ~/.config/zsh/source-file/nvm.zsh
source ~/.config/zsh/source-file/sdkman.zsh
source ~/.config/zsh/source-file/rbenv.zsh
source ~/.config/zsh/source-file/exa.zsh
# source ~/.config/lf/lf.zsh

# -------------------------------------------------------

eval "$(starship init zsh)" # starship
# eval "$(zoxide init zsh)" # zoxide
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

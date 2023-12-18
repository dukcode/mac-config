source ~/.config/zsh/source-file/pyenv.zsh
source ~/.config/zsh/source-file/nvm.zsh
source ~/.config/zsh/source-file/sdkman.zsh
source ~/.config/zsh/source-file/rbenv.zsh
# source ~/.config/lf/lf.zsh

# -------------------------------------------------------

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  )
source $ZSH/oh-my-zsh.sh

# -------------------------------------------------------

# zsh plugins
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-history-substring-search/zsh-history-substring-search.zsh
# source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# bindkey '^[[A' history-substring-search-up
# bindkey '^[[B' history-substring-search-down

eval "$(starship init zsh)" # starship
# eval "$(zoxide init zsh)" # zoxide
# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh # fzf

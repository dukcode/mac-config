#!/bin/bash

# 명령어 라인 개발자 도구 설치
xcode-select --install
echo "설치가 완료되었다면 아무 키나 눌러 진행해 주세요."
read -s -n 1

# install brew
sudo chmod 777 ~/.zshenv
sudo chmod 777 ~/.zprofile
sudo chmod 777 ~/.zshrc

/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile

# install via brew
eval "$(/opt/homebrew/bin/brew shellenv)"
brew bundle --file=./Brewfile

# 보안 및 개인 정보 보호 설정
# sudo xattr -dr com.apple.quarantine /Applications/[App name]
sudo xattr -dr com.apple.quarantine /Applications/Alacritty.app
sudo xattr -dr com.apple.quarantine /Applications/AppCleaner.app
sudo xattr -dr com.apple.quarantine /Applications/IntelliJ\ IDEA.app
sudo xattr -dr com.apple.quarantine /Applications/Obsidian.app
sudo xattr -dr com.apple.quarantine /Applications/Rectangle.app
sudo xattr -dr com.apple.quarantine /Applications/Discord.app
sudo xattr -dr com.apple.quarantine /Applications/Google\ Chrome.app
sudo xattr -dr com.apple.quarantine /Applications/Mos.app
sudo xattr -dr com.apple.quarantine /Applications/Postman.app
sudo xattr -dr com.apple.quarantine /Applications/Sourcetree.app
sudo xattr -dr com.apple.quarantine /Applications/Anki.app
sudo xattr -dr com.apple.quarantine /Applications/Docker.app
sudo xattr -dr com.apple.quarantine /Applications/IINA.app
sudo xattr -dr com.apple.quarantine /Applications/Notion.app
sudo xattr -dr com.apple.quarantine /Applications/Visual\ Studio\ Code.app

# font 설치
sudo cp -a ./fonts/. /Library/Fonts

# 한영 전환 설정
# right-command -> F18, right-option -> F18
sudo cp ./com.local.KeyRemapping.plist /Library/LaunchAgents/com.local.KeyRemapping.plist

# sdkman 및 java 설치
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk install java 17.0.9-tem
sdk default java 17.0.9-tem

# python  설치
echo 'export PYENV_ROOT="$HOME/.pyenv"' >>  ~/.zshrc
echo '[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(pyenv init -)"' >> ~/.zshrc
source ~/.zshrc
pyenv install 3.11.7
pyenv global 3.11.7

# node, npm 설치
echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
echo '[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm' >> ~/.zshrc
echo '[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion' >> ~/.zshrc
source ~/.zshrc
nvm install --lts
nvm use --lts

# rust, cargo 설치
rustup-init -y
source "$HOME/.cargo/env"

# lunarvim 설치
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)
"export PATH=$HOME/.local/bin:\$PATH" >> ~/.zshenv

# ---------------------------

# jekyll을 위한 ruby 설치
rbenv install 3.1.4 # 3.2.X 는 오류 발생
rbenv global 3.1.4
echo 'eval "$(/opt/homebrew/bin/rbenv init - zsh)"' >> ~/.zshrc
ruby --version
gem install jekyll bundler
bundle install


# 블로그 디렉터리 이등 ->  bundle exec jekyll serve

# tmux plugin 설치
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# oh-my-zsh 설치
echo "export ZSH=\$XDG_CONFIG_HOME/oh-my-zsh" >> ~/.config/zsh/.zshenv # 설치 위치 변경
source ~/.config/zsh/.zshenv
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# dock 딜레이 줄이기
# 속도 :  0.1  ~  0.5  사이 값 조정
defaults write com.apple.dock autohide -bool true && defaults write com.apple.dock autohide-delay -float 0 && defaults write com.apple.dock autohide-time-modifier -float 0 && killall Dock
# 원상 복구
# defaults delete com.apple.dock autohide && defaults delete com.apple.dock autohide-delay && defaults delete com.apple.dock autohide-time-modifier && killall Dock


# zshenv 설정 : zsh 설정 파일들을 ~/.config/zsh로 옮긴다
zshenv="/etc/zshenv"
if [ ! -e $zshenv ]; then
  sudo touch $zshenv
fi
echo "export XDG_CONFIG_HOME=\$HOME/.config" | sudo tee -a $zshenv
echo "export ZDOTDIR=\$XDG_CONFIG_HOME/zsh" | sudo tee -a $zshenv
source $zshenv
rm ~/.zshenv
rm ~/.zprofile
rm ~/.zshrc
rm ~/.zlogin
rm ~/.zlogout
rm ~/.zsh_history
rm ~/.zcompdump
rm ~/.zsh_sessions
echo "터미널을 재실행 해주세요"
read -s -n 1

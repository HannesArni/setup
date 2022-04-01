#!/usr/bin/env bash

# Install brew
if test ! $(which brew); then
  echo “Installing brew…”
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/hannesarni/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
  
  brew analytics off
fi

brew update
brew tap heroku/brew

BREWS=(
  # Github util
  gh

  # File watcher from Facebook
  watchman

  heroku
  docker-compose
  python

  # Dependency manager for XCode
  cocoapods

  node
)
brew install ${BREWS[@]}

CASKS=(
  # Development tools
  webstorm
  datagrip
  docker
  iterm2
  postman
  android-studio

  # Browsers
  google-chrome

  # faster spotlight
  alfred

  # keyboard layout manager
  ukelele

  # Other apps
  1password
  slack
  spotify
  anydesk

  # Window manager
  rectangle
)
brew install --cask ${CASKS[@]}

mas install 497799835 # XCode

# Install fonts
brew tap homebrew/cask-fonts
FONTS=(
  font-roboto
  font-fira-code
  font-meslo-for-powerline
)
brew install --cask ${FONTS[@]}

# Install yarn
npm i -g yarn

# Install global node packages
PACKAGES=(
  expo-cli
  typescript
  eslint
)
yarn global add ${PACKAGES[@]}

echo "Oh my zsh plugins…"
# Powerlevel 10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
# Better directory listing with k
git clone https://github.com/supercrabtree/k.git $ZSH_CUSTOM/plugins/k
# Show alias for the command being run
git clone https://github.com/djui/alias-tips.git $ZSH_CUSTOM/plugins/alias-tips
# Clear terminal when running new commands
git clone https://github.com/Valiev/almostontop.git $ZSH_CUSTOM/plugins/almostontop
# More completions
git clone https://github.com/zsh-users/zsh-completions.git $ZSH_CUSTOM/plugins/zsh-completions
# Syntax highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
# Auto suggestions from history
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions

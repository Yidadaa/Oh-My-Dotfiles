#!/bin/bash

# 命令行配置
echo 'Installing Common Tools...'
if [[ $OSTYPE == 'darwin'* ]]; then
  xcode-select --install
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  export HOMEBREW_CORE_GIT_REMOTE="https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git"
  for tap in core cask{,-fonts,-drivers,-versions} command-not-found; do
    brew tap --custom-remote --force-auto-update "homebrew/${tap}" "https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-${tap}.git"
  done
  brew update
  brew install -y tmux procs ripgrep fzf fd reattach-to-user-namespace delta rust bat
  brew install --cask font-jetbrains-mono
else
  sudo apt-get install -y curl git tmux ripgrep fzf fd-find xclip delta cargo bat zsh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/JetBrains/JetBrainsMono/master/install_manual.sh)"
fi

echo 'Setting up VIM'
# 安装 VIM 插件
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

# 侧边栏
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q

# 同步 VIM 配置文件
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.vimrc > ~/.vimrc # VIM配置

# Tmux
echo 'Setting up Tmux...'
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.tmux.conf > ~/.tmux.conf
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
# 使用 prefix + I 来安装 tpm 管理的插件

# wezterm/kitty
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.wezterm.lua > ~/.wezterm.lua

curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/kitty.config > ~/.config/kitty.config

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.zshrc > ~/.zshrc

# 命令行工具
echo 'Installing awesome cli tools...'
pip3 install tldr # 用于替代 man 命令
# 别名：alias fd=fdfind

mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# 快捷脚本
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/oh-my-day.sh > ~/.local/bin/oh-my-day.sh

echo 'Done, enjoy coding :)'

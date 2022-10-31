#!/bin/bash

# 命令行配置
echo 'Installing Common Tools...'
sudo apt-get install -y curl git zsh tmux procs ripgrep fzf fd-find xclip delta

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

# wezterm
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.wezterm.lua > ~/.wezterm.lua

# zsh
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.zshrc > ~/.zshrc

# 安装oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 

# 命令行工具
echo 'Installing awesome cli tools...'
pip3 install tldr # 用于替代 man 命令
# 别名：alias fd=fdfind

sudo apt install -o Dpkg::Options::="--force-overwrite" bat ripgrep -y # 用于替代 cat 工具
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat
# 与 fzf 搭配使用：fzf="fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
# 别名：alias cat=bat
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/oh-my-day.sh > ~/.local/bin/oh-my-day.sh

# 或者更高级的用法
fif() {
	rg  \
	--column \
	--line-number \
	--no-column \
	--no-heading \
	--fixed-strings \
	--ignore-case \
	--hidden \
	--follow \
	--glob '!.git/*' "$1" \
	| awk -F  ":" '/1/ {start = $2<5 ? 0 : $2 - 5; end = $2 + 5; print $1 " " $2 " " start ":" end}' \
	| fzf --preview 'bat --wrap character --color always {1} --highlight-line {2} --line-range {3}' --preview-window wrap
}

echo 'Done, enjoy coding :)'

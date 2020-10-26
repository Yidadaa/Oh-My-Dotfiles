#!/bin/bash

# 命令行配置
echo 'Installing Common Tools...'
sudo apt-get install -y curl
sudo apt-get install -y git
sudo apt-get install -y zsh

echo 'Setting up VIM'
# 安装 VIM 插件
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
# 侧边栏
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
# git 显示，由于兼容性问题，暂时关闭该配置项
# git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin

# 同步 VIM 配置文件
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.vimrc > ~/.vimrc # VIM配置

echo 'Setting up Tmux...'
sudo apt install -y tmux
curl https://raw.githubusercontent.com/Yidadaa/Linux-Desktop-Config/master/.tmux.conf > ~/.tmux.conf

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # 安装oh-my-zsh

echo 'Done, enjoy coding :)'

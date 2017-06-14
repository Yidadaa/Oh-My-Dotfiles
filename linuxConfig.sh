#!/bin/bash

# 命令行配置
sudo apt-get install curl
sudo apt-get install git
sudo apt-get install zsh
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" # 安装oh-my-zsh

# 主题美化
# 默认是对Ubuntu进行美化
sudo apt-get install gnome-shell
git clone https://github.com/LinxGem33/OSX-Arc-White.git
cp ./OSX-Arc-White /usr/share/themes # 安装osx主题
sudo add-apt-repository ppa:numix/ppa
sudo apt-get update
sudo apt-get install numix # 安装numix图标主题
git clone https://github.com/optimisme/gnome-shell-simple-dock.git　# 安装dock栏
cd gnome-shell-simple-dock
chmod 744 install.sh
./install.sh
# 需要重新进入桌面环境

curl https://raw.githubusercontent.com/wklken/vim-for-server/master/vimrc > ~/.vimrc # VIM配置

# 触控板配置
sudo apt-get install ruby
gem install fusuma
mkdir ~/.config/fusuma
cp ./sh/config.yml ~/.config/fusuma # 配置触控板手势

# 一些常用软件需要安装
# 网易云，VSCode，ShadowSocks-qt5
# 直接下载会很慢，最好用windows下的迅雷下载

sudo cp ./sh/start-fusuma.sh /etc/profile.d/ # 设置开机启动
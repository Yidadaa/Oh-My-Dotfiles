#!/bin/bash

red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)
clear=$(tput sgr0)

today=$(date +"%m%d")
branch_prefix="yifei-$today-$1"

echo -e "${blue}[寄]${clear} 开始工作了！"
read -p "${blue}[寄]${clear} 今天的分支名是: $branch_prefix" name


branch_name=$branch_prefix$name

echo -e "${blue}[寄]${clear} 正在建造分支 ${green}$branch_name${clear}\n"

git stash clear
git stash
git checkout main
git pull
git branch $branch_name
git checkout $branch_name
git stash apply

echo -e "\n${blue}[寄]${clear} 完成了，牛马出动！\n"

#!/bin/bash

######################################
###### Script for wsl - ubuntu #######
######        By Pelle         #######
######################################

# backup config, historic and other important files

echo "** START BACKUP SCRIPT"

cd /mnt/c
export username=$(cmd.exe /C "echo %USERNAME%")
export domain=$(cmd.exe /C "echo %USERDOMAIN%")
cd - > /dev/null

export WIN_MNT_PATH="/mnt/c/Users/$username"
# test if tar exists
if ! command -v tar &> /dev/null;
then
    echo "> Couldn't found tar, exiting"
    exit
fi

echo "Using windows user dir = $WIN_MNT_PATH"
# files to backup
files2back=("$HOME/.gitconfig"
            "$HOME/.zshrc"
            "$HOME/.ssh/config"
            "$WIN_MNT_PATH/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json"
            "$HOME/.zsh_history")

echo "${files2back[@]}"
for file in "${files2back[@]}"; do
    echo $file
done

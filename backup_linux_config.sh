#!/usr/bin/env bash

######################################
###### Script for wsl - ubuntu #######
######        By Pelle         #######
######################################

# backup config, historic and other important files

echo "** START BACKUP SCRIPT"

cd /mnt/c
# Remove windows command carriage return with sed
windows_user="$(cmd.exe /C "echo %USERNAME%" | sed 's/\r$//' )"
domain="$(cmd.exe /C "echo %USERDOMAIN%"| sed 's/\r$//' )"
cd - > /dev/null

# echo $windows_user
# echo $domain
WIN_MNT_PATH="/mnt/c/Users/$windows_user"

# test if tar exists
if ! command -v tar &> /dev/null;
then
    echo "> Couldn't found tar, exiting"
    exit
fi

echo "Using windows user dir = $WIN_MNT_PATH"
# files to backup
declare -a files2backup

files2backup=( "$WIN_MNT_PATH/AppData/Local/Packages/Microsoft.WindowsTerminal_*/LocalState/settings.json"
            "$HOME/.gitconfig"
            "$HOME/.zshrc"
            "$HOME/.ssh/config"
            "$HOME/.zsh_history" )

for file in "${files2backup[@]}"; do
    if [ ! -f $file ]; then
        echo "$file not found on disk."
        exit 1
    fi
done

tar czvf "${domain}_${windows_user}_config_backup.tar.gz" ${files2backup[@]}

echo "** BACKUP FINISHED"
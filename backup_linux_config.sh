#!/bin/bash

######################################
###### Script for wsl - ubuntu #######
######        By Pelle         #######
######################################

# backup config, historic and other important files

echo "** START BOOTSTRAP SCRIPT"
# Display shell commands
set -x

# test if Gzip exists
if ! command -v zzz &> /dev/null;
then
    echo "> Couldn't found gzip, exiting"
    exit
fi

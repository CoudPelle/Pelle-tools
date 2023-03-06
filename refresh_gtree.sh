#!/bin/bash

######################################
###### Script for wsl - ubuntu #######
######        By Pelle         #######
######################################


# Cycle and refresh all official branches


for branch in sandbox dev recette preproduction production
do
	git checkout $branch && git pull
done
git checkout sandbox


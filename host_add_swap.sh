#!/bin/bash

# Add swap to the docker host

 # check if swap
 swapon --show
 free -h
 
 # Create a Swap File
 # @URIR https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-16-04
 
fallocate -l 2G /swapfile

chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
free -h

ls -lh /swapfile


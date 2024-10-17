#! /bin/bash

# Install a list of packages given by the first argument of the script
pacman -Syu --needed $(grep -v ^# "$1")

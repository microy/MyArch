#! /bin/bash

# Remove a list of packages given by the first argument of the script
pacman -Rns $(grep -v ^# "$1")

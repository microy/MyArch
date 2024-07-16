#!/bin/bash

# Halt on error
set -e

# Get date
DATE=$(date "+%Y%m%d")

# Install file
install --backup --suffix=.$DATE $1 $2	
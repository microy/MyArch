#!/bin/bash

# Halt on error
set -e

# Install file
install -D --mode=644 --backup --suffix=.$(date "+%Y%m%d") $1 $2

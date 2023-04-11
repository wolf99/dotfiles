#! /usr/bin/env bash

# ## Description
#
# Creates a standard set of links for my WSL setup
# Links are created in the directory the script is run from
#
# ## Arguments
#
# - First argument should be the Windows username in the form it appears
#    in at %HOMEDRIVE%%HOMEPATH%
#
# ## Example Usage
#
# ```bash
# ./create-links.sh wolf99
# ```

ln -s /mnt/c/Users/"$1"/OneDrive/Documents/development dev
ln -s /mnt/c/Users/"$1"/git git
ln -s /mnt/c/Users/"$1"/OneDrive one
ln -s /mnt/c/Users/"$1"/ "$1"

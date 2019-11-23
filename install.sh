#!/usr/bin/env bash

# backup location
BACKUP_DIR="${HOME}/cd backup_dot_files"

# install location
INSTALL_DIR="${HOME}"

# list files to exclude
EXCLUDE_FILES=(".git" "install.sh" "prompt.bash" "bash_prompt.bash")

# get current dir (so run this script from anywhere)
export DOTFILES_DIR
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}")" && pwd)"

# update dotiles itself first
#git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

function is_file_excluded () {
    # check if the file is on the list of exclusions
    # $1 = file to check for exclusions
    for EF in "${EXCLUDE_FILES[@]}"; do
        if [ "$1" == "${EF}" ]; then
            echo "Excluding ${EF}"
            return 0
        fi
    done
    return 1
}

function backup_file () {
    # $1 = file to backup
    # $2 = directory to back up to
    mkdir -p "$2"
    mv "$1" "$2"
}

function install_dot_files () {
    # loop on each file in this directory
    for F in $(ls -A "${DOTFILES_DIR}"); do
        # skip an excluded file
        if is_file_excluded ${F}; then
            continue
        fi

        INSTALL_FILE=${INSTALL_DIR}/${F}
        BACKUP_FILE=${BACKUP_DIR}/${F}
        DOT_FILE=$DOTFILES_DIR/${F}

        # if file exists and is already a link, skip this file
        # this does not mean the existing link points to the this new file
        # but this script will not handle this case
        if [ -h "${INSTALL_FILE}" ]; then
                echo "A link already exists at ${INSTALL_FILE}, skipping"
                continue
        fi

        # if the regular file exists, back it up
        if [ -f "${INSTALL_FILE}" ]; then
            echo "Backing up ${INSTALL_FILE} to ${BACKUP_FILE}"
            backup_file $INSTALL_FILE ${BACKUP_DIR}
        fi

        echo "Creating link at ${INSTALL_FILE}"
        mkdir -p "$INSTALL_DIR"
        ln -sfv "$DOT_FILE" "${INSTALL_FILE}"
    done
}

install_dot_files

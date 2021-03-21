# My WSL 2 Bash Dotfiles

## Requirements

- Windows Subsystem for Linux (WSL) version 2.0

## Instructions

1. Clone this repository
2. Copy the dotfiles to your home directory (be careful not to copy the `.git` directory)
3. Add the missing details in [.gitconfig][.gitconfig], the `signingkey` will need to wait until after step 6.2
4. Make the `create-links.sh` script executable `~$ chmod +x ./dotfiles/create-links.sh`
5. From your home directory, run `~$ ./dotfiles/create-links.sh <username>`
6. Optionally:
   1. Follow the steps in [ssh-setup.md].
   2. Follow the steps in [gpg-setup.md].
   3. Follow the steps in [how-to-update-maven.md].

[.gitconfig]: ./.gitconfig
[ssh-setup.md]: ./ssh-setup.md
[gpg-setup.md]: ./gpg-setup.md
[how-to-update-maven.md]: ./how-to-update-maven.md


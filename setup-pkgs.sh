#! /usr/bin/env bash

# ## Description
#
# Installs a set of applications to make getting setup easier
# Assumes some version of git is already installed
# (else how would you have go this file?)
# Assumes apt installed
#
# Uses apt so will need to be run with super user permissions
#
# ## Arguments
#
# No arguments, but you may need to update the version variables below to get
# the latest packages installed.
#
# ## Example Usage
#
# ```bash
# sudo  ./setup-pkgs
# ```

EXA_VERSION="0.9.0"
RIPGREP_VERSION="12.1.0"
GCC_VERSION=9
GRADLE_VERSION="6.4.1"

# TODO: colourise echo output to make it more apparent from all the apt output

# sudo apt list --installed # To see all currently installed packages

echo "## Updating existing installation"
apt update --yes
apt upgrade --yes

echo "## Installing latest git"
add-apt-repository --yes ppa:git-core/ppa # Add the PPA for the latest git, default git on Ubuntu 18.04 is as old as Santa
apt update --yes
apt install --yes git
echo "## Installing tig"
apt install --yes tig
echo "## Installing htop"
apt install --yes htop
echo "## Installing shellcheck"
apt install --yes shellcheck

echo "## Installing exa"
# TODO: only install if does not exist or existing version is different
wget --ccontinue https://github.com/ogham/exa/releases/download/v"$EXA_VERSION"/exa-linux-x86_64-"$EXA_VERSION".zip
unzip exa-linux-x86_64-"$EXA_VERSION".zip
mv exa-linux-x86_64 /usr/local/bin/exa

echo "## Installling ripgrep"
# TODO: use which in `if` to only do uninstall when needed
echo "### Uninstalling any old ripgrep installation"
# May need to uninstall older ripgrep version
apt remove --purge --yes ripgrep
# Install latest version
wget --continue https://github.com/BurntSushi/ripgrep/releases/download/"$RIPGREP_VERSION"/ripgrep_"$RIPGREP_VERSION"_amd64.deb
sudo dpkg --install ripgrep_"$RIPGREP_VERSION"_amd64.deb
rm ripgrep_"$RIPGREP_VERSION"_amd64.deb

echo "## Installing C/C++ build tools"
add-apt-repository -y ppa:ubuntu-toolchain-r/test
# build-essential includes GNU make
apt install --yes build-essential manpages-dev gcc-"$GCC_VERSION" g++-"$GCC_VERSION" gdb indent
# If adding later versions add additional alternative rather then editing
# existing command (if you want multiple versions)
# The default version is the one with the highest priority.
# Could use `sudo update-alternatives --config gcc` to change existing alternatives
update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-"$GCC_VERSION" 90 \
                    --slave /usr/bin/g++ g++ /usr/bin/g++-"$GCC_VERSION" \
                    --slave /usr/bin/gcov gcov /usr/bin/gcov-"$GCC_VERSION"

echo "## Installing Python 3"
# Python3 itself should already be installed on Ubuntu >= 18.04
# So only need to install pip
apt install --yes python3-pip
# TODO: config as just `python`?

echo "## Installing OpenJDK"
apt install --yes default-jdk # This is currently JDK 11 on Ubuntu 18.04
# TODO: Setup up JAVA_HOME and other env vars (perhaps check work laptop setup)

echo "## Installing Gradle"
wget --continue https://downloads.gradle-dn.com/distributions/gradle-"$GRADLE_VERSION"-all.zip
mkdir /opt/gradle
unzip -d /opt/gradle gradle-"$GRADLE_VERSION"-bin.zip

# TODO: ... below
# whatever it was I used to setup both git credentials
# Remember I already have a "how to install Maven" md... add sh for that too?
# maven
# Will need to figure out the correct file (maybe here) to set the following env vars
# and should then maybe remove from dot files? Or have this script cat it to the dot files?
# MAVEN_HOME GRADLE_HOME,
# Same for adding Gradle and Maven to the $PATH
# (perhaps check work laptop setup)
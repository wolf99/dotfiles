# How to Install or Update Maven on Ubuntu

## Download the Latest Package

1. Visit the Maven downloads page to find the latest package version number ([maven][maven])

    - Alternatively, you can use this command to get the value (thanks @Qarj on [#1][issue-1] )
      ```bash
      VER=$(wget -qO- https://maven.apache.org/download.cgi | grep -Po "(?<=Apache Maven )[^ ]+(?= is the latest)")
      ```

2. Download the tarball of the latest version at the prompt using `wget`, substituting the version number for `${VER}`
  ```bash
  wget http://www-eu.apache.org/dist/maven/maven-3/${VER}/binaries/apache-maven-${VER}-bin.tar.gz
  ```
3. Extract the downloaded tarball
  ```bash
  tar xvf apache-maven-${VER}-bin.tar.gz
  ```

## Install

4. Move the extracted directory to `/opt/maven/`
  ```bash
  sudo mv apache-maven-${VER} /opt/maven/
  ```
5. Setup environment variables to load Maven when the shell starts
  ```bash
  sudo vim /etc/profile.d/maven.sh
  # Add or edit following lines with latest version
  export MAVEN_HOME=/opt/maven/apache-maven-${VER}
  export PATH=${MAVEN_HOME}/bin:${PATH}
  ```
6. Make this new script executable
  ```bash
  sudo chmod +x /etc/profile.d/maven.sh
  ```
7. Source the script file to make the environment variables available in the current session
  ```bash
  source /etc/profile.d/maven.sh
  ```

## Check

1. Check if the environment and PATH contains Maven
  ```bash
  > printenv | grep maven
  ```
2. Check the correct installation is used for the `mvn` command
  ```bash
  > which mvn
  /opt/maven/apache-maven-3.6.3/bin/mvn
  ```

[maven]: https://maven.apache.org/download.cgi
[issue-1]: https://github.com/wolf99/dotfiles/issues/1
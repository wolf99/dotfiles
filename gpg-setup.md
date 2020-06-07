# GPG Set Up for GitHub

## Create a New Key

Ref: [GitHub Help: create a new key][create-key]

1. Check for existing GPG keys
    ```bash
    gpg --list-secret-keys --keyid-format LONG
    ```
2. If there are no GPG key pairs or none suitable, generate a new one (t least 4096 bits, user ID in form `<id>+<username>@users.noreply.github.com`)
    ```bash
    gpg --full-generate-key
    ```
3. List the keys again (see 1) and copy the ID from the new key (e.g. `3AA5C34371567BD2`)
4. Output the pulic key, and copy it for addition to GitHub
    ```bash
    gpg --armor --export <your-key-id>
    ```
## Add key to GitHub

See: [GitHub Help: add key to GitHub][add-to-github]

## Tell Git About the Key

Ref: [GitHub help: tell Git about your key][add-to-git]

1. Ensure Git email address is set to GitHub email
    ```bash
    git config --global user.email "<your-github-email>"
    # probably also
    git config --global user.name "<your-GitHub-username>"
    ```
2. Set the key in Git
    ```bash
    git config --global user.signingkey <your-key-id>
    ```
3. Configure Git to use the key for every commit (this will apply even to repos that are not GitHub ones :| )
    ```bash
    git config --global commit.gpgsign true

4. Tell Git to use GPG (unsure if step needed?)
    ```bash
    git config --global gpg.program gpg
    ```

## Set GitHub's Key in Your Keychain

1. Get the key from GitHub
    ```bash
    curl https://github.com/web-flow.gpg | gpg --import
    ```

2. Sign the key (if you trust it)
    ```bash
    gpg --sign-key 4AEE18F83AFDEB23
    ```

## Set GPG Agent to Remember the Pass Phrase for 24 Hours

- Add the following to `.gnupg/gpg-agent.conf`
    ```bash
    # set the default cache time to 1 day
    default-cache-ttl 86400
    default-cache-ttl-ssh 86400

    # set the max cache time to 30 days
    max-cache-ttl 2592000
    max-cache-ttl-ssh 2592000
    ```

- May or may not need `echo 'export GPG_TTY=$(tty)' >> ~/.bashrc` for the gpg-agent... not sure.

[ssh-ident]: https://github.com/ccontavalli/ssh-ident
[create-key]: https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key
[add-to-github]: https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account
[add-to-git]: https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key

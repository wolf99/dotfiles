# GPG Set Up for GitHub

## Check for Existing Keys

1. Check for existing GPG keys

    ```console
    $ gpg --list-secret-keys --keyid-format LONG
    sec   rsa4096/<key-id>   <creation-date>  [SC]
          <fingerprint>
    uid            [ultimate] <email-address>
    ssb    rsa4096/<secret sub-key-id> <creation-date> [SC]
    ```

## Moving Existing Key From an Old Machine

Ref: [Moving/Copying your PGP Keys][move-keys]

1. Export the key(s) on the old machine

    ```console
    gpg --export-secret-keys --armor keyid > my_private_key.asc
    gpg --export --armor keyid > my_public_key.asc
    ```

2. Import the keys new machine

    ```console
    gpg --import my_private_key.asc
    gpg --import my_public_key.asc
    ```

3. Ensure the key ID is correct

    ```console
    gpg --edit-key <email-address>
    ```

4. Then add ultimate trust for it by typing `trust` at the prompt and selecting ultimate trust.

## Create a New Key

Ref: [GitHub Help: create a new key][create-key]

1. If there are no existing GPG key pairs or none suitable, generate a new one (t least 4096 bits, user ID in form `<id>+<username>@users.noreply.github.com`)

    ```console
    gpg --full-generate-key
    ```

2. List the keys again (see 1) and copy the ID from the new key (e.g. `3AA5C34371567BD2`)
3. Output the pulic key, and copy it for addition to GitHub

    ```console
    gpg --armor --export <your-key-id>
    ```

## Add key to GitHub

See: [GitHub Help: add key to GitHub][add-to-github]

## Tell Git About the Key

Ref: [GitHub help: tell Git about your key][add-to-git]

1. Ensure Git email address is set to GitHub email

    ```console
    git config --global user.email "<your-github-email>"
    # probably also
    git config --global user.name "<your-GitHub-username>"
    ```

2. Set the key in Git

    ```console
    git config --global user.signingkey <your-key-id>
    ```

3. Configure Git to use the key for every commit (this will apply even to repos that are not GitHub ones :| )

    ```console
    git config --global commit.gpgsign true
    ```

4. Tell Git to use GPG (unsure if step needed?)

    ```console
    git config --global gpg.program gpg
    ```

## Set GitHub's Key in Your Keychain

1. Get the key from GitHub

    ```console
    curl https://github.com/web-flow.gpg | gpg --import
    ```

2. Sign the key (if you trust it)

    ```console
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

[move-keys]: https://www.phildev.net/pgp/gpg_moving_keys.html
[create-key]: https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key
[add-to-github]: https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account
[add-to-git]: https://help.github.com/en/github/authenticating-to-github/telling-git-about-your-signing-key

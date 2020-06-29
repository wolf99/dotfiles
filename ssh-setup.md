# SSH Set Up

## Create a New SSH Key

Ref: [GitHub help: create key][create-key]

1. Check for existing SSH keys
    ```bash
    ls -al ~/.ssh
    ```
2. Generate a new key if there is no suitable existing key
    ```bash
    ssh-keygen -t rsa -b 4096 -C "<your-email>"
    ```
3. Add the key to your GitHub account: [GitHub help: add a key][add-key]

## Test Pass Phrase

Ref: [StackOverflow: validate passphrase][validate-passphrase]

To check if your pass phrase is correct:

```bash
ssh-add
```

## Handling the Pass Phrase

- I have been using [ssh-ident][ssh-ident] to manage this

- GitHub have started [recommending][agent-script] a script for ssh-agent

For information on the different options, see: [StackOverflow: run ssh add automatically][auto-ssh-add]

### Setting Up ssh-ident

1. Get the script from GitHub (following assumes `--output-document` path directory is on the PATH)
    ```bash
    wget --output-document=~/.local/bin/ssh-ident https://raw.githubusercontent.com/ccontavalli/ssh-ident/master/ssh-ident
    ```
2. Link it in place of `ssh`
    ```bash
    ln -s ~/.local/bin/ssh-ident ~/.local/bin/ssh

[create-key]: https://help.github.com/en/github/authenticating-to-github/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent
[add-key]: https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account
[validate-passphrase]: https://stackoverflow.com/questions/4411457/how-do-i-verify-check-test-validate-my-ssh-passphrase
[ssh-ident]: https://github.com/ccontavalli/ssh-ident
[agent-script]: https://help.github.com/en/github/authenticating-to-github/working-with-ssh-key-passphrases#auto-launching-ssh-agent-on-git-for-windows
[auto-ssh-add]: https://unix.stackexchange.com/questions/90853/how-can-i-run-ssh-add-automatically-without-a-password-prompt/90869#90869

# dotfiles

Bootstrap a fresh macOS machine.

## One-line install

```sh
curl https://raw.githubusercontent.com/owinter86/dotfiles/HEAD/.macos | bash
```

This runs [`.macos`](.macos), which:

1. Sets Git identity and sensible Git defaults
2. Installs Homebrew
3. Clones this repo to `~/code/dotfiles`
4. Installs every app and CLI tool from the [`Brewfile`](Brewfile) via `brew bundle`
5. Installs Oh My Zsh, Starship, and Node LTS (via `fnm`)
6. Generates an SSH key and helps register it with GitHub (`gh ssh-key add`)
7. Applies system preferences (Finder, Dock, screenshots, trackpad)

## Managing packages

Packages live in the `Brewfile` (declarative, idempotent).

```sh
brew bundle --file=Brewfile          # install anything missing
brew bundle check --file=Brewfile    # report what's missing
brew bundle dump --file=Brewfile --force   # regenerate from this machine
```

> Note: `brew bundle dump` has been observed to omit some third-party-tap
> formulae. After a dump, diff against `brew leaves` to confirm nothing was lost.

Cursor extensions are synced separately (via Cursor's own settings sync), so
they are not managed in this repo.

## Post-install

- `gh auth login` then `gh ssh-key add ~/.ssh/id_ed25519.pub`
- Sign in to Warp, 1Password, Raycast, Slack, Spotify
- Confirm the macOS prompt to set Safari as the default browser

# dotfiles

Bootstrap a fresh macOS machine.

## One-line install

```sh
curl https://raw.githubusercontent.com/owinter86/dotfiles/HEAD/.macos | bash
```

This runs [`.macos`](.macos), which:

1. Sets Git identity and sensible Git defaults
2. Installs Homebrew
3. Clones this repo to `~/code/dotfiles` and copies [`.zshrc`](.zshrc) into `~`
4. Installs every app and CLI tool from the [`Brewfile`](Brewfile) via `brew bundle`
5. Uses plain zsh + Starship (no framework) and installs Node LTS (via `fnm`)
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
- Sign in to Warp, 1Password, Slack, Spotify
- Confirm the macOS prompt to set Safari as the default browser

### React Native / Expo

- `eas login` to authenticate the Expo CLI
- **Xcode** (can't be scripted — App Store / GUI gated):
  - Install Xcode from the App Store, then `sudo xcode-select -s /Applications/Xcode.app`
    and `sudo xcodebuild -runFirstLaunch`
  - Add an iOS Simulator runtime: Xcode → Settings → Components → iOS
- **Android** is set up automatically by `.macos` (SDK 36 + build-tools + emulator
  image, and a `Pixel_API_36` AVD). Just open Android Studio once to let it adopt
  the existing `~/Library/Android/sdk`. Launch the emulator with
  `emulator -avd Pixel_API_36`.

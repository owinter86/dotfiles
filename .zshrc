# ~/.zshrc — managed in ~/code/dotfiles (symlinked by .macos)
# Plain zsh + starship. No framework. Warp provides its own
# autosuggestions/syntax-highlighting/completions natively.

# ── Homebrew (PATH, MANPATH, FPATH) ──────────────────────────────────────────
eval "$(/opt/homebrew/bin/brew shellenv)"

# ── Completions ──────────────────────────────────────────────────────────────
# Pick up Homebrew-installed completions (gh, etc.), then init zsh's native
# completion system.
FPATH="/opt/homebrew/share/zsh/site-functions:$FPATH"
autoload -Uz compinit && compinit

# ── History ──────────────────────────────────────────────────────────────────
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE INC_APPEND_HISTORY

# ── Sensible defaults ────────────────────────────────────────────────────────
setopt AUTO_CD              # `foo` cd's into foo/ if it's a directory
setopt INTERACTIVE_COMMENTS # allow `# comments` in the interactive shell

# ── Aliases (the bits of the oh-my-zsh git plugin worth keeping) ─────────────
alias gst='git status'
alias gco='git checkout'
alias gc='git commit'
alias gp='git push'
alias gl='git pull'
alias gd='git diff'
alias glog='git log --oneline --graph --decorate'

# ── Toolchains ───────────────────────────────────────────────────────────────
# Node via fnm, auto-switching on cd (reads .nvmrc/.node-version up the tree)
eval "$(fnm env --use-on-cd --version-file-strategy=recursive)"

# Java (Azul Zulu 17 — installed via Brewfile)
export JAVA_HOME="/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home"

# Android SDK (Android Studio)
export ANDROID_HOME="$HOME/Library/Android/sdk"
path+=("$ANDROID_HOME/emulator" "$ANDROID_HOME/platform-tools")

# User-local binaries
path+=("$HOME/.local/bin")
export PATH

# ── Optional: zsh sugar for non-Warp terminals (iTerm, SSH) ──────────────────
# Warp provides these natively, so they're off by default. To enable:
#   brew install zsh-autosuggestions zsh-syntax-highlighting
# then uncomment (syntax-highlighting must be sourced LAST):
# source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# ── Prompt (keep last) ───────────────────────────────────────────────────────
eval "$(starship init zsh)"

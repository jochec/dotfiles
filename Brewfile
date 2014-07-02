# Install command-line tools using Homebrew
# Usage: `brew bundle Brewfile`

# Make sure we’re using the latest Homebrew
update

# Upgrade any already-installed formulae
upgrade

# Install GNU core utilities (those that come with OS X are outdated)
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
install coreutils
# Install Bash 4
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before running `chsh`.
install bash
install bash-completion

# Install more recent versions of some OS X tools
install macvim --override-system-vim

# Required for Tagbar VIM plugin
install ctags-exuberant
# Required for YouCompleteMe
install cmake

# Install other useful binaries
install git
install tree
install python

linkapps

# Remove outdated versions from the cellar
cleanup
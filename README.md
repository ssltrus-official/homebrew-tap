# SSLTrus Homebrew Tap

[English](README.md) · [简体中文](README.zh_CN.md)

This tap provides the SSLTrus code signing command-line client and desktop
application for macOS.

Install the command-line client:

```shell
brew tap ssltrus-official/tap
brew install ssltrus-official/tap/code-sign-cli
```

Install the desktop application:

```shell
brew install --cask ssltrus-official/tap/code-sign-gui
```

The CLI executable is installed as `signtool`. Homebrew-managed upgrades are
recommended for both packages so that the installed version stays in sync with
Homebrew's package metadata.

The GUI cask clears the macOS quarantine attribute after installation and may
request the administrator password.

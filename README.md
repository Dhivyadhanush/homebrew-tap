# Homebrew tap

Formulae and casks for my macOS apps.

```shell
brew tap Dhivyadhanush/tap
```

## Ritual

Self-hosted health reminders for hydration, movement, habits and monthly
check-ins, delivered through ntfy and mirrored to a watch.

```shell
brew install ritual
ritual hash-password "your password"
edit "$(brew --prefix)/etc/ritual.env"
brew services start ritual
```

Dashboard: <http://127.0.0.1:4322>

Run `brew info ritual` for configuration and service commands.

Source and release notes: [Dhivyadhanush/ritual](https://github.com/Dhivyadhanush/ritual).

## S-Info

A menu bar server monitor: Docker containers, per-application usage, a rolling
30-day history, and a logged `sudo apt update && sudo apt upgrade -y` every
30 days.

```shell
brew install --cask s-info
```

If Homebrew asks you to trust the tap first:

```shell
brew trust Dhivyadhanush/tap
```

Source and release notes: [Dhivyadhanush/s-info](https://github.com/Dhivyadhanush/s-info).

# Dotfiles managed by chezmoi

This repository contains my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

## Introduction

`chezmoi` allows you to manage your shell configurations, editor settings, and other dotfiles across multiple machines using a single git repository.

## Installation

### 1. Install chezmoi

First, ensure `chezmoi` is installed on your system.

**Linux:**
```sh
sh -c "$(curl -fsLS get.chezmoi.io)"
```

**macOS (Homebrew):**
```sh
brew install chezmoi
```

### 2. Initialize and Apply

To download and apply these dotfiles on a new machine in one go:

```sh
chezmoi init --apply zaknafein99
```

If you are using SSH keys for authentication:

```sh
chezmoi init --apply git@github.com:zaknafein99/dotfiles.git
```

## Usage

### Editing Configuration

Do not edit files in your home directory directly if you want changes to persist. Instead, use `chezmoi edit`:

```sh
chezmoi edit ~/.bashrc
```

### Applying Changes

After editing, check the diff and apply the changes to your home directory:

```sh
chezmoi diff
chezmoi apply
```

### Adding New Files

To start tracking a new file (e.g., `.vimrc`):

```sh
chezmoi add ~/.vimrc
```

### Syncing Updates

To pull the latest changes from the repository and apply them:

```sh
chezmoi update
```

### Committing Changes

To push your changes back to GitHub:

```sh
cd ~/.local/share/chezmoi
git add .
git commit -m "Description of changes"
git push origin main
```

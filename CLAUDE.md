# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles and configuration files for macOS (primary) and Ubuntu. The repo manages shell configs, git settings, and window manager keybindings via symlinks from `$HOME`.

## Installation

```bash
./install.sh osx    # or: ./install.sh ubuntu
```

The install script symlinks files from `common/` and the platform-specific directory (e.g. `osx/`) into `$HOME`. Files in `common/` apply to all platforms; platform-specific files override or supplement them.

## Structure

- `common/` — Cross-platform configs (`.gitconfig`)
- `osx/` — macOS-specific: zsh configs (`.zshrc`, `.zprofile`, `.zalias`), bash configs (`.bashrc`, `.bash-aliases`, `.profile`), yabai WM (`.yabairc`), skhd hotkeys (`.skhdrc`), Alacritty terminal (`.alacritty.yml`)
- `ubuntu/` — Ubuntu-specific: bash configs (`.bashrc`, `.bash_aliases`)

## Key Details

- **Primary shell is zsh** on macOS with vi-mode keybindings and starship prompt
- **yabai** is the tiling window manager; **skhd** provides hotkey bindings — both configs are tightly coupled
- `.gitconfig` uses conditional includes (`includeif`) to load org-specific git identity based on repo path (`~/src/north-capital/`, `~/src/273ventures/`, etc.)
- Git is configured with `pull.rebase = true` and `rerere.enabled = true`
- These files are symlinked into `$HOME` — edits here are live immediately

## Editing Guidelines

- These are dotfiles, not application code — there are no tests or builds
- Preserve existing formatting and commenting style
- Be cautious with skhd keycodes (e.g. `0x33` = backspace, `0x2B` = comma, `0x2F` = period) — they are not obvious and should not be changed without understanding the mapping
- The `.zshrc` sources `.zalias`; the `.bashrc` sources `.bash-aliases` — keep alias definitions in the alias files

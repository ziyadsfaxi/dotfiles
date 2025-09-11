# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a dotfiles repository for a macOS development environment with symbolic link-based configuration management. The configurations focus on terminal-based workflows, PHP/Laravel development, and tiling window management.

## Common Commands

### Installation & Setup
```bash
# Install all dotfiles (creates symlinks)
./install

# Quick tmux session management with fzf
t                    # Opens project selector
t <project-name>     # Opens specific session
```

### Laravel Development
```bash
a <command>          # Artisan alias (e.g., a migrate:fresh --seed)
sqlit               # Switch database to SQLite
laravel-setup       # Full Laravel project setup with DB, npm, and server
```

## High-Level Architecture

### Configuration Organization
- **Symlink-based**: The `install` script creates symlinks from this repository to standard config locations (`~/.config/`, `~/.zshrc`, etc.)
- **Modular Structure**: Each application has its own directory (nvim/, tmux/, zsh/, etc.)
- **Theme Consistency**: Catppuccin theme is used across multiple tools (tmux, ghostty, nvim)

### Key Components
1. **Neovim**: LazyVim-based configuration in `nvim/` with extensive LSP support, particularly for C# (Roslyn)
2. **Window Management**: Yabai (tiling WM) + SKHD (hotkeys) for macOS window control using vim-like bindings
3. **Shell**: Zsh with Oh My Zsh, extensive Laravel/PHP aliases, and custom functions
4. **Scripts**: Custom utilities in `scripts/` added to PATH, including the `t` tmux session manager

### Development Focus
- Strong Laravel/PHP tooling integration (Herd, Composer shortcuts)
- Git workflow optimization with extensive aliases in `git/gitconfig`
- Docker and Docker Compose shortcuts for containerized development
- NVM for Node.js version management with default packages

### Installation Process
The `install` script:
1. Creates symlinks for each configuration to its expected location
2. Handles directory cleanup and recreation for clean installs
3. Installs Oh My Zsh if not present
4. Sets up local bin directory in PATH

When modifying configurations, changes take effect immediately due to symlinks. Running `./install` again is only needed when adding new configuration files or directories.
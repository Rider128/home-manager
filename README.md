# Dotfiles (Home Manager + Flakes)

My personal Home Manager configuration managed with Nix Flakes. This repository lets me maintain a consistent, reproducible environment across my machines.

## Profiles

The flake defines three distinct profiles:

* **`mac-matthieu`** : My macOS setup (Apple Silicon).
* **`perso`** : My personal Linux desktop (daily driver, media & desktop apps).
* **`pro`** : My Linux work profile (development tools and specific packages like EPICS).

## Structure

* **`common/`** : Shared base used across all machines (CLI tools, Zsh shell with Starship, Jujutsu, Atuin, Ghostty...).
* **`darwin/`** & **`linux/`** : OS-specific adjustments and integrations.
* **`perso/`** & **`pro/`** : Packages and configurations specific to each profile.
* **`secrets/`** : Keys and hosts encrypted with `sops-nix` and `age`.

## Neovim Setup

My entire Neovim setup is declared in pure Nix in `common/cli/nvf.nix` using the [**nvf**](https://github.com/NotAShelf/nvf) framework.

This provides an editor ready out of the box (LSP for Nix, Rust, Python, Go, Treesitter, auto-formatting, Lualine) configured declaratively without managing manual Lua configs.

## Usage

Check flake evaluation:
```bash
nix flake check
```

Apply a configuration to the current machine:
```bash
# On my Mac
home-manager switch --flake .#mac-matthieu

# On my personal Linux desktop
home-manager switch --flake .#perso
```

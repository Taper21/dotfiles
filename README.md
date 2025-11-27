# Dotfiles (managed with chezmoi)

These are my personal dotfiles, managed using [chezmoi](https://www.chezmoi.io/).

chezmoi lets me keep my configuration files in a Git repo and safely apply them across multiple machines (Linux/macOS/WSL), with support for templates, secrets, and machine-specific config. 

---

## Requirements

- `chezmoi` installed on the target machine  
  Installation options are documented here:  
  👉 https://www.chezmoi.io/install/ 

On most systems you can install it via your package manager (e.g. `brew install chezmoi`, `pacman -S chezmoi`, etc.), or with the one-liner from the install page.

---

## Bootstrap (new machine)

Clone this repo and apply the dotfiles in one go:

```bash
# replace with your own repo URL
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply git@github.com:YOUR_USERNAME/dotfiles.git

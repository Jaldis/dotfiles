#!/bin/bash

set -e

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
HOME_DIR="$HOME"

create_link() {
    local src="$1"
    local dest="$2"
    
    if [ -e "$dest" ] || [ -L "$dest" ]; then
        if [ -L "$dest" ]; then
            echo "Removing existing symlink: $dest"
            rm "$dest"
        else
            echo "Skipping (exists and is not a symlink): $dest"
            return
        fi
    fi
    
    echo "Creating symlink: $dest -> $src"
    ln -s "$src" "$dest"
}

mkdir -p "$HOME_DIR/.config"

create_link "$DOTFILES_DIR/nvim" "$HOME_DIR/.config/nvim"
create_link "$DOTFILES_DIR/.bashrc" "$HOME_DIR/.bashrc"
create_link "$DOTFILES_DIR/.tmux.conf" "$HOME_DIR/.tmux.conf"
create_link "$DOTFILES_DIR/starship.toml" "$HOME_DIR/.config/starship.toml"

if [ -f "$HOME_DIR/.bashrc" ]; then
    if ! grep -q "dotfiles/bash" "$HOME_DIR/.bashrc" 2>/dev/null; then
        echo ""
        echo "# dotfiles bash settings" >> "$HOME_DIR/.bashrc"
        echo "for f in $DOTFILES_DIR/bash/*; do [ -f \"\$f\" ] && . \"\$f\"; done" >> "$HOME_DIR/.bashrc"
        echo "Appended source for bash/ scripts to .bashrc"
    fi
fi

echo ""
echo "Setup complete!"
echo "Please restart your shell or run: source ~/.bashrc"
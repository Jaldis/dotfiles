#!/bin/bash
set -e

echo "=== Jaldis Dev Setup ==="

GO_VERSION="1.21.0"
ZIG_VERSION="0.13.0"
RUST_VERSION="stable"
NVIM_VERSION="0.10.0"

echo "[1/7] Installing system dependencies..."
if command -v apt-get &> /dev/null; then
    sudo apt-get update
    sudo apt-get install -y build-essential gcc g++ make unzip curl git ripgrep fd clangd tmux pass gnupg
elif command -v pacman &> /dev/null; then
    sudo pacman -Sy --noconfirm base-devel gcc make unzip git ripgrep fd clang tmux pass gnupg
elif command -v brew &> /dev/null; then
    brew install gcc make unzip git ripgrep fd clangd tmux pass gnupg
fi

echo "Git version: $(git --version)"
echo "Tmux version: $(tmux -V)"

echo "Installing languages"

echo "[2/7] Installing Go..."
if ! command -v go &> /dev/null; then
    curl -sL "https://go.dev/dl/go${GO_VERSION}.linux-amd64.tar.gz" | sudo tar -C /usr/local -xz
fi
echo "Go version: $(go version)"

echo "[3/7] Installing gopls..."
go install golang.org/x/tools/cmd/gopls@latest

echo "[4/7] Installing Rust..."
if ! command -v rustc &> /dev/null; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
fi
rustup install "$RUST_VERSION"
rustup component add rust-analyzer clippy

echo "[5/7] Installing Zig..."
if ! command -v zig &> /dev/null; then
    curl -sL "https://ziglang.org/download/zig-linux-x86_64-${ZIG_VERSION}.tar.xz" -o /tmp/zig.tar.xz
    sudo tar -xf /tmp/zig.tar.xz -C /usr/local --strip-components=1
    rm /tmp/zig.tar.xz
fi
echo "Zig version: $(zig version)"

echo "[6/7] Installing Neovim..."
if ! command -v nvim &> /dev/null; then
    curl -sLO "https://github.com/neovim/neovim/releases/download/v${NVIM_VERSION}/nvim-linux64.tar.gz"
    sudo tar -xzf nvim-linux64.tar.gz -C /opt
    sudo ln -sf /opt/nvim-linux64/bin/nvim /usr/local/bin/nvim
    rm nvim-linux64.tar.gz
fi
echo "Neovim version: $(nvim --version | head -1)"

echo "[7/7] Setting up dotfiles..."
DOTFILES_ROOT="$(cd "$(dirname "$0")" && pwd)"

if [ ! -d "$DOTFILES_ROOT/.git" ]; then
    echo "Error: Not a git repository. Please initialize git first."
    exit 1
fi

echo "Symlinking ~/.config/nvim -> $DOTFILES_ROOT/nvim"
mkdir -p "$HOME/.config"
rm -rf "$HOME/.config/nvim"
ln -s "$DOTFILES_ROOT/nvim" "$HOME/.config/nvim"

echo "Symlinking ~/.bashrc -> $DOTFILES_ROOT/bash/bashrc"
rm -rf "$HOME/.bashrc"
ln -s "$DOTFILES_ROOT/bash/bashrc" "$HOME/.bashrc"

echo "Symlinking ~/.zshrc -> $DOTFILES_ROOT/zsh/zshrc"
mkdir -p "$HOME/.config/zsh"
rm -rf "$HOME/.zshrc"
ln -s "$DOTFILES_ROOT/zsh/zshrc" "$HOME/.zshrc"

echo "Symlinking ~/.tmux.conf -> $DOTFILES_ROOT/.tmux.conf"
rm -rf "$HOME/.tmux.conf"
ln -s "$DOTFILES_ROOT/.tmux.conf" "$HOME/.tmux.conf"

echo "Symlinking ~/.gitconfig -> $DOTFILES_ROOT/.gitconfig"
rm -rf "$HOME/.gitconfig"
ln -s "$DOTFILES_ROOT/.gitconfig" "$HOME/.gitconfig"

echo ""
echo "=== Setup Complete ==="
echo ""
echo "Next steps:"
echo "1. Run :Lazy sync to install plugins"
echo "2. Run :MasonInstallAll to install language servers"
echo "3. Run :TSInstall all to install Treesitter parsers"
echo "4. Run :Copilot setup for GitHub Copilot"
echo ""
echo "Install language servers manually:"
echo "  :MasonInstall lua_ls pyright tsserver clangd rust_analyzer zls gopls"
echo ""
echo "Install Treesitter parsers:"
echo "  :TSInstall c cpp rust go zig lua python typescript"




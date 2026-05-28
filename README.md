# Jaldis Dotfiles

Automated development environment setup script.

## What setup.sh Does

The `setup.sh` script automates the installation of all dependencies and languages required for your development environment. It supports apt-get (Debian/Ubuntu), pacman (Arch), and brew (macOS).

## What Gets Installed

### System Dependencies

| Package | Purpose |
|---------|---------|
| build-essential | C/C++ compiler toolchain |
| gcc/g++ | C/C++ compilers |
| make | Build automation |
| unzip | Archive extraction |
| curl | HTTP requests |
| **git** | Version control |
| ripgrep | Fast text search |
| fd | Fast file finder |
| fzf | Fuzzy finder (used by telescope) |
| clangd | C/C++ language server |
| **tmux** | Terminal multiplexer |
| **pass** | Password manager |
| **gpg** | Encryption & signing |

### Languages & Tools

| Language/Tool | Version | Purpose |
|---------------|---------|---------|
| Go | 1.21.0 | Go programming language |
| gopls | latest | Go language server |
| Rust | stable | Rust programming language |
| rust-analyzer | latest | Rust language server |
| clippy | latest | Rust linter |
| Zig | 0.13.0 | Zig programming language |
| Neovim | 0.10.0 | Text editor |

## Installing fzf

On Debian/Ubuntu:
```bash
sudo apt-get install fzf
```

On Arch:
```bash
sudo pacman -S fzf
```

On macOS:
```bash
brew install fzf
```

Alternatively, use the git repo for the latest version:
```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Dotfiles Symlinks

After installation, the following symlinks are created:

| Source | Destination |
|--------|-------------|
| `~/.config/nvim` | `dotfiles/nvim` |
| `~/.bashrc` | `dotfiles/bash/bashrc` |
| `~/.zshrc` | `dotfiles/zsh/zshrc` |
| `~/.tmux.conf` | `dotfiles/.tmux.conf` |

## Usage

```bash
git clone <your-repo> ~/.dotfiles
cd ~/.dotfiles
./setup.sh
```

## Post-Install Steps

After running setup.sh, initialize Neovim plugins and language servers:

```vim
:Lazy sync
:MasonInstall lua_ls pyright tsserver clangd rust_analyzer zls gopls
:TSInstall c cpp rust go zig lua python typescript
:Copilot setup
```

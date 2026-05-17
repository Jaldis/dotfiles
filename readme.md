##212 e Jaldis Neovim Configuration

Minimal Neovim configuration built with **lazy.nvim**, featuring LSP, autocompletion, fuzzy finding, and more.

## Dependencies

### Required

- **Neovim** >= 0.10
- **Git**
- **make** / **gcc**
- **Node.js** >= 18
- **npm**
- **unzip** (for mason)

### Recommended (for optimal plugin functionality)

- **ripgrep** — Required for Telescope `live_grep`
- **fd** — Faster file searching for Telescope
- **lazygit** — Complements Fugitive for terminal Git workflow
- **Go** >= 1.21 — For gopls
- **Rust** — For rust_analyzer
- **Clang** — For clangd

### LSP Servers

Installed automatically via **Mason** (`:Mason`):
- `lua_ls`
- `pyright`
- `tsserver`
- `clangd`
- `rust_analyzer`
- `zls`
- `gopls`

Ensure language runtimes are available on your system:
- **Python 3** (for pyright)
- **Node.js** (for tsserver)
- **Go** (for gopls)

#### Installing Go and gopls

```bash
# Install Go
curl -sL https://go.dev/dl/go1.21.0.linux-amd64.tar.gz | sudo tar -C /usr/local -xz
export PATH=$PATH:/usr/local/go/bin

# Install gopls
go install golang.org/x/tools/cmd/gopls@latest

# Add Go bin to PATH (add to ~/.bashrc or ~/.zshrc)
export PATH=$PATH:$(go env GOPATH)/bin
```

#### Installing rust_analyzer

```bash
# Via rustup
rustup component add rust-analyzer

# Or via Mason (`:MasonInstall rust_analyzer`)
```

#### Installing clangd

```bash
# Debian/Ubuntu
sudo apt install clangd

# Arch Linux
sudo pacman -S clang
```

## Installation

```bash
git clone <your-repo> ~/.config/nvim
```

Open Neovim — plugins install automatically on first launch:
```bash
nvim
```

Install language servers:
```vim
:MasonInstallAll
```

Install Treesitter parsers:
```vim
:TSInstall <language>
```

Authenticate Copilot:
```vim
:Copilot setup
```

## Structure

```
lua/
└── jaldis/
    ├── init.lua           # Core settings
    ├── keymap.lua         # Leader keymaps
    ├── lazy.lua           # Plugin specs + lazy bootstrap
    └── plugins/
        ├── cmp.lua        # Autocompletion
        ├── copilot.lua    # GitHub Copilot
        ├── dracula.lua    # Theme
        ├── fugitive.lua   # Git integration
        ├── harpoon.lua    # File navigation
        ├── lspconfig.lua  # LSP config loader
        ├── luasnip.lua    # Snippet engine
        ├── mason.lua      # LSP management + keymaps
        ├── telescope.lua  # Fuzzy finder
        ├── toggleterm.lua # Terminal
        ├── treesitter.lua # Syntax highlighting
        └── undotree.lua   # Undo history

```

## Keymaps

### Leader (`<Space>`)

| Keymap | Action |
|--------|--------|
| `<Space><Space>` | File explorer |
| `<Space>ff` | Find files |
| `<Space>fg` | Live grep |
| `<Space>fb` | Buffers |
| `<Space>fh` | Help tags |
| `<Space>ft` | Treesitter |
| `<Space>a` | Add to Harpoon |
| `<Space>h` | Harpoon menu |
| `<Space>h1-4` | Jump to Harpoon mark |
| `<Space>gs` | Git status |
| `<Space>gd` | Git diff |
| `<Space>gb` | Git blame |
| `<Space>gc` | Git commit |
| `<Space>gp` | Git push |
| `<Space>gpl` | Git pull |
| `<Space>rn` | Rename |
| `<Space>ca` | Code action |
| `<Space>sv/sh` | Split vertical/horizontal |
| `<Space>se` | Equalize splits |
| `<Space>sx` | Close split |
| `<Space>to/tx` | New/close tab |
| `<Space>tn/tp` | Next/prev tab |
| `<Space>u` | Toggle undotree |

### Normal

| Keymap | Action |
|--------|--------|
| `K` | Hover documentation |
| `gD` | Declaration |
| `gd` | Definition |
| `gi` | Implementation |
| `gr` | References |
| `n/N` | Search centered |
| `<C-d>/<C-u>` | Scroll centered |

### Insert

| Keymap | Action |
|--------|--------|
| `<Tab>` | Next completion/snippet |
| `<S-Tab>` | Previous completion/snippet |
| `<C-Space>` | Trigger completion |
| `<CR>` | Confirm selection |
|# DOTFILES

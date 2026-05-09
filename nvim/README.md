# Jaldis Neovim Configuration

Minimal Neovim configuration built with **lazy.nvim**, featuring LSP, autocompletion, fuzzy finding, and more.

## Dependencies

### Required

- **Neovim** >= 0.9
- **Git**
- **make** / **gcc**
- **Node.js** >= 18
- **npm**
- unzip (for mason)

### Recommended (for optimal plugin functionality)

- **ripgrep** — Required for Telescope `live_grep`
- **fd** — Faster file searching for Telescope
- **lazygit** — Complements Fugitive for terminal Git workflow

### LSP Servers

Installed automatically via **Mason** (`:Mason`):
- `lua_ls`
- `pyright`
- `tsserver`

Ensure language runtimes are available on your system:
- **Python 3** (for pyright)
- **Node.js** (for tsserver)

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
        ├── fugitive.lua   # Git integration
        ├── harpoon.lua    # File navigation
        ├── luasnip.lua    # Snippet engine
        ├── mason.lua      # LSP management + keymaps
        ├── telescope.lua  # Fuzzy finder
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
| `<C-j>` | Copilot accept |

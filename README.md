# Neovim Configuration

Personal Neovim configuration using Lua and [lazy.nvim](https://github.com/folke/lazy.nvim) as the plugin manager.

## Directory Structure

```
nvim/
├── init.lua                 # Entry point – sets leader keys, loads config modules
├── lazy-lock.json           # Pinned plugin versions (auto-managed by lazy.nvim)
└── lua/
    ├── config/
    │   ├── options.lua      # General editor options (search, indent, clipboard, …)
    │   ├── keymaps.lua      # Key mappings (window nav, buffers, tabs, search, …)
    │   ├── autocmds.lua     # Autocommands (cursor restore, filetype tweaks, …)
    │   └── lazy.lua         # lazy.nvim bootstrap and setup
    └── plugins/
        ├── aerial.lua       # Code outline sidebar (replaces tagbar)
        ├── claudecode.lua   # Claude Code integration
        ├── colorscheme.lua  # Gruvbox dark theme
        ├── completion.lua   # nvim-cmp + LuaSnip snippets
        ├── copilot.lua      # GitHub Copilot
        ├── gitsigns.lua     # Git diff signs in the gutter
        ├── lualine.lua      # Statusline and bufferline
        ├── nvim-tree.lua    # File explorer sidebar (replaces NERDTree)
        └── telescope.lua    # Fuzzy finder (replaces ctrlp)
```

## Prerequisites

- **Neovim ≥ 0.9** (0.10+ recommended)
- **Git** (required by lazy.nvim to clone plugins)
- A **C compiler** (for treesitter parsers and LuaSnip jsregexp)
- A clipboard provider (`xclip`, `xsel`, or system clipboard) for `clipboard=unnamed`

## Installation / Syncing to a New Machine

1. **Clone this repository** into your Neovim config directory:

   ```bash
   git clone https://github.com/DylanJoo/nvim-configs.git ~/nvim-configs
   ```

2. **Symlink** (or copy) the `nvim` directory to Neovim's config path:

   ```bash
   # Linux / macOS (default XDG path)
   ln -sf ~/nvim-configs/nvim ~/.config/nvim

   # Or set XDG_CONFIG_HOME if you prefer a custom location
   export XDG_CONFIG_HOME=~/nvim-configs
   ```

3. **Launch Neovim** – lazy.nvim will bootstrap itself and install all plugins automatically on first start:

   ```bash
   nvim
   ```

4. **(Optional) Restore exact plugin versions** from the lock file:

   ```bash
   nvim --headless "+Lazy restore" +qa
   ```

## Plugins

| Plugin | Purpose |
|--------|---------|
| [gruvbox.nvim](https://github.com/ellisonleao/gruvbox.nvim) | Colorscheme (dark, hard contrast) |
| [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim) | Statusline and buffer/tab line |
| [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua) | File explorer sidebar |
| [aerial.nvim](https://github.com/stevearc/aerial.nvim) | Code outline / symbol sidebar |
| [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) | Fuzzy finder for files, grep, buffers |
| [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) | Auto-completion engine |
| [LuaSnip](https://github.com/L3MON4D3/LuaSnip) | Snippet engine (with friendly-snippets) |
| [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) | Git change indicators in the sign column |
| [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) | Syntax highlighting and code analysis |
| [copilot.vim](https://github.com/github/copilot.vim) | GitHub Copilot |
| [claudecode.nvim](https://github.com/coder/claudecode.nvim) | Claude Code integration |

## Key Bindings

**Leader key:** `<Space>`

### General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>/` | Normal | Clear search highlight |
| `<leader>r` | Normal | Replace word under cursor across all buffers |
| `<leader>p` | Normal | Toggle paste mode |
| `<leader>g` | Normal | Insert C/C++ include guard |

### Navigation

| Key | Mode | Action |
|-----|------|--------|
| `<C-J>` | Normal | Move to split below and maximize |
| `<C-K>` | Normal | Move to split above and maximize |
| `<C-H>` | Normal | Move to left split and maximize |
| `<C-L>` | Normal | Move to right split and maximize |
| `gb` / `gB` | Normal | Next / previous buffer |
| `XX` | Normal | Delete current buffer |
| `<leader>b` | Normal | List buffers and switch |
| `<C-t><C-t>` | Normal | New tab |
| `<C-t><C-w>` | Normal | Close tab |

### Plugins

| Key | Mode | Action |
|-----|------|--------|
| `<Left>` | Normal | Toggle file explorer (nvim-tree) |
| `<Right>` | Normal | Toggle code outline (aerial) |
| `<leader>f` | Normal | Find files (Telescope) |
| `<leader>fg` | Normal | Live grep (Telescope) |
| `<leader>fb` | Normal | List buffers (Telescope) |
| `<leader>fh` | Normal | Help tags (Telescope) |

### Git (gitsigns)

| Key | Mode | Action |
|-----|------|--------|
| `]c` / `[c` | Normal | Next / previous git hunk |
| `<leader>hp` | Normal | Preview hunk |
| `<leader>hs` | Normal | Stage hunk |
| `<leader>hu` | Normal | Undo stage hunk |

### Completion (nvim-cmp)

| Key | Mode | Action |
|-----|------|--------|
| `<Tab>` / `<S-Tab>` | Insert | Cycle completion items / snippets |
| `<CR>` | Insert | Confirm completion |
| `<C-Space>` | Insert | Trigger completion |
| `<C-e>` | Insert | Abort completion |

### Claude Code

| Key | Mode | Action |
|-----|------|--------|
| `<leader>ac` | Normal | Toggle Claude |
| `<leader>af` | Normal | Focus Claude |
| `<leader>ar` | Normal | Resume Claude |
| `<leader>aC` | Normal | Continue Claude |
| `<leader>am` | Normal | Select Claude model |
| `<leader>ab` | Normal | Add current buffer to Claude |
| `<leader>as` | Visual | Send selection to Claude |
| `<leader>aa` | Normal | Accept diff |
| `<leader>ad` | Normal | Deny diff |

## Customization

- **Options** — edit `nvim/lua/config/options.lua`.
- **Key mappings** — edit `nvim/lua/config/keymaps.lua` (core) or the relevant file under `nvim/lua/plugins/` (plugin-specific).
- **Add a plugin** — create a new `.lua` file in `nvim/lua/plugins/`; lazy.nvim auto-discovers files in that directory.
- **Pin / update plugins** — run `:Lazy update` inside Neovim; commit the updated `lazy-lock.json` to keep versions reproducible.

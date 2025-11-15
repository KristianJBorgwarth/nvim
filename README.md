# Neovim Configuration

This is my personal Neovim setup.  
It is tuned for C# development with some configurations for TypeScript, Lua, and general-purpose use.
The configuration is subject to change as I find out what works best for me and improve my workflow.

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim)
- LSP support for C#, TypeScript, and Lua
- Telescope for fuzzy finding
- Treesitter for syntax highlighting and text objects
- Trouble.nvim for diagnostics, references, quickfix, and related lists
- UI plugins including Noice, Notify, Lualine, Neo-tree
- Debugging and dotnet test integrations

## Installation

### Prerequisites

- Neovim 0.11 or newer  
- git  
- Node.js (required for several language servers)  
- Dotnet SDK (required for C# LSP, debugging, and testing; optional otherwise)

### Clone the repository

Clone directly into the Neovim config path:

```sh
git clone https://github.com/KristianJBorgwarth/nvim.git ~/.config/nvim
```

Or clone anywhere else:

```sh
git clone https://github.com/KristianJBorgwarth/nvim.git ~/nvim
```

Then link it:

```sh
ln -s ~/nvim ~/.config/nvim
```

### Start Neovim

Open Neovim and let lazy.nvim install all plugins:

```sh
nvim
```

On first start, lazy.nvim will install all plugins. This may take a little bit. Patience.

## Directory Structure

```sh
- init.lua: Main entry point for Neovim configuration.
- lua/: Contains all Lua modules for configuration.
  - plugins/: Plugin configurations.
  - lsp/: Language Server Protocol configurations.
  - keymaps/: Custom key mappings.
  - scripts/: Utility scripts 
```

## Customization

Feel free to modify the configuration files under `lua/` to customize your Neovim setup. You can add or remove plugins, change key mappings, and adjust LSP settings as needed.

# Neovim Configuration

This repository contains my personal Neovim configuration files. It is fairly simple and still a work in progress. It is tailored towards my work and hobby projects, which mainly revolve around the use of C# and backend development, which the configuration reflects.

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim) 
- LSP support for multiple languages
- Fuzzy finding with Telescope
- Syntax highlighting with Treesitter
- Custom keybindings and UI enhancements

## Installation

1. **Clone this repository:**
    ```sh
    git clone https://github.com/KristianJBorgwarth/nvim.git ~/.config/nvim
    ```

2. **Open Neovim:**
    ```sh
    nvim
    ```
    Plugins will install automatically on startup.

## Requirements

- [Neovim](https://neovim.io/) (v0.11+)
- [git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (for some LSPs and plugins)

## Customization

Feel free to modify the configuration files to suit your your needs. Check the `lua/` directory for settings and plugin configurations.

---

Happy coding

# Neovim Configuration

This repository contains my personal Neovim configuration files. It is fairly simple and still a work in progress. It is tailored towards my work and hobby projects, which mainly revolve around the use of C# and backend development, which the configuration reflects.

## Features

- Plugin management with [lazy.nvim](https://github.com/folke/lazy.nvim) 
- LSP support for multiple languages
- Fuzzy finding with Telescope
- Syntax highlighting with Treesitter
- Custom keybindings and UI enhancements

## Installation

### Prerequisites
- installing neovim on your system. Instructions can be found here: https://github.com/neovim/neovim/blob/master/INSTALL.md
- **Note:** some commands and features of my configuration will not work without installing dotnet. (you can easily go through the files and remove dotnet related stuff, like roslyn, test pacakges, etc)

1. **Clone this repository:**
    ```sh
    git clone https://github.com/KristianJBorgwarth/nvim.git ~/.config/nvim
    ```
2. **Link the configuration**
   ```sh
    ln -s ~/nvim_config_file_location/nvim/ ~/.config/nvim 
    ```
   
3. **Open Neovim:**
    ```sh
    nvim
    ```
    Plugins will install automatically on startup.

## Requirements

- [Neovim](https://neovim.io/) (v0.11+)
- [git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (for some LSPs and plugins)
- [dotnet](https://https://dotnet.microsoft.com/en-us/) (for some dotnet related commands)

## Customization

Feel free to modify the configuration files to suit your your needs. Check the `lua/` directory for settings and plugin configurations.

---

Happy coding

# 💤 LazyVim Dotfiles

A comprehensive Neovim configuration built on top of [LazyVim](https://github.com/LazyVim/LazyVim), specifically tailored for full-stack web development with TypeScript, PHP/Laravel, and Docker workflows.

## ✨ Features

### 🛠️ Core Setup

- **LazyVim**: Fast and feature-rich Neovim distribution
- **File Explorer**: Oil.nvim for better file management with dotfile support
- **Fuzzy Finding**: FZF-lua with hidden file support
- **Project Management**: Automatic project detection and switching
- **Terminal Integration**: Toggleterm for seamless terminal access

### 🎨 UI/UX Enhancements

- **PhpStorm-like Keybindings**: Familiar shortcuts for IDE users
- **Multiple Cursors**: vim-visual-multi for efficient editing
- **Smart Notifications**: Enhanced notification system
- **Modern Status Line**: Informative lualine configuration
- **Indent Guides**: Clear visual indentation
- **Animations**: Smooth UI transitions

### 🌐 Language Support

#### TypeScript/JavaScript

- **LSP**: Full TypeScript/JavaScript language server support
- **Error Translation**: Human-readable TypeScript error messages
- **Import Management**: Automatic import organization and cost analysis
- **Package Info**: Real-time package.json insights
- **Inlay Hints**: Type information display
- **NestJS Snippets**: Ready-to-use code templates

#### PHP/Laravel

- **LSP**: Intelephense and PHPActor for comprehensive PHP support
- **Laravel Integration**: Artisan commands, route navigation, and model relationships
- **Blade Support**: Syntax highlighting for Laravel templates
- **Database UI**: Visual database management with vim-dadbod
- **Testing**: PHPUnit and Pest test runner integration
- **Debugging**: Xdebug support
- **Namespace Management**: Automatic use statement handling

#### Additional Languages

- **Docker**: Dockerfile and docker-compose support
- **YAML**: Schema validation for GitHub Actions, CircleCI
- **Prisma**: Full ORM support with syntax highlighting
- **JSON**: Schema validation and formatting
- **Markdown**: Enhanced editing and preview

### 🔧 Development Tools

- **Formatting**: Prettier, PHP CS Fixer, Pint, and more
- **Linting**: ESLint integration
- **Debugging**: DAP support for multiple languages
- **Testing**: Integrated test runners
- **Git Integration**: Advanced git workflow support
- **Search & Replace**: Powerful find/replace with Spectre

## 📋 Prerequisites

- **Neovim** >= 0.9.0
- **Git**
- **Node.js** (for LSP servers and formatters)
- **PHP** (if working with PHP projects)
- **Composer** (for PHP dependency management)
- **Ripgrep** (for better search performance)
- **FZF** (for fuzzy finding)

### Optional Dependencies

- **Docker** (for containerized development)
- **Laravel** (for PHP web development)
- **Xdebug** (for PHP debugging)

## 🚀 Installation

1. **Backup existing Neovim configuration:**

   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this repository:**

   ```bash
   git clone https://github.com/yourusername/lazyvim_dotfiles.git ~/.config/nvim
   ```

3. **Start Neovim:**

   ```bash
   nvim
   ```

4. **Let LazyVim install plugins automatically** (this may take a few minutes on first run)

5. **Install language servers and formatters:**
   - Open Neovim and run `:Mason` to install additional tools
   - Most tools will be installed automatically based on your file types

## ⌨️ Key Bindings

### File Navigation

| Key                | Action                        |
| ------------------ | ----------------------------- |
| `<C-p>`            | Find files                    |
| `<C-S-f>`          | Search in files               |
| `<C-e>`            | Recent files                  |
| `-` or `<leader>e` | Open file explorer (Oil.nvim) |

### Editing (PhpStorm-style)

| Key             | Action                   |
| --------------- | ------------------------ |
| `<C-/>`         | Toggle comment           |
| `<C-d>`         | Duplicate line/selection |
| `<C-S-Up/Down>` | Move line up/down        |
| `<C-n>`         | Multiple cursors         |

### Code Navigation

| Key          | Action               |
| ------------ | -------------------- |
| `gd`         | Go to definition     |
| `gr`         | Go to references     |
| `gi`         | Go to implementation |
| `<F2>`       | Rename symbol        |
| `<leader>ca` | Code actions         |

### Debugging

| Key         | Action                   |
| ----------- | ------------------------ |
| `<F5>`      | Continue/Start debugging |
| `<F10>`     | Step over                |
| `<F11>`     | Step into                |
| `<F12>`     | Step out                 |
| `<leader>b` | Toggle breakpoint        |

### Language-Specific

#### PHP/Laravel

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>la` | Laravel Artisan commands |
| `<leader>lr` | Laravel routes           |
| `<leader>lm` | Laravel related files    |
| `<leader>u`  | PHP use class            |
| `<leader>db` | Database UI              |

#### TypeScript

| Key          | Action                |
| ------------ | --------------------- |
| `<leader>to` | Organize imports      |
| `<leader>tR` | Rename file           |
| `<leader>ta` | Add missing imports   |
| `<leader>tu` | Remove unused imports |

### Testing

| Key          | Action       |
| ------------ | ------------ |
| `<leader>tt` | Test nearest |
| `<leader>tf` | Test file    |
| `<leader>ts` | Test suite   |
| `<leader>tl` | Test last    |

### Terminal & Docker

| Key          | Action            |
| ------------ | ----------------- |
| `<C-`>`      | Toggle terminal   |
| `<leader>dc` | Docker containers |
| `<leader>di` | Docker images     |

## 📁 Project Structure

```
~/.config/nvim/
├── init.lua                    # Entry point
├── lazy-lock.json             # Plugin versions lock file
├── lazyvim.json              # LazyVim configuration
├── lua/
│   ├── config/
│   │   ├── autocmds.lua      # Auto commands
│   │   ├── keymaps.lua       # Key mappings
│   │   ├── lazy.lua          # Lazy.nvim setup
│   │   └── options.lua       # Neovim options
│   └── plugins/
│       ├── lsp.lua          # LSP configuration (consolidated)
│       ├── editor.lua        # Editor enhancements
│       ├── formatting.lua    # Code formatting
│       ├── fzf.lua          # Fuzzy finder config
│       ├── php.lua          # PHP/Laravel tools
│       ├── snippets.lua     # Code snippets
│       ├── treesitter.lua   # Syntax highlighting
│       ├── typescript.lua   # TypeScript tools
│       └── ui.lua           # UI improvements
└── stylua.toml              # Lua formatter config
```

## 🎯 Customization

This configuration is designed to be easily customizable:

1. **Adding new plugins**: Create new files in `lua/plugins/`
2. **Modifying keybindings**: Edit `lua/config/keymaps.lua`
3. **Changing options**: Modify `lua/config/options.lua`
4. **Language-specific settings**: Edit the corresponding plugin file

### Example: Adding a new plugin

Create `lua/plugins/your-plugin.lua`:

```lua
return {
  "author/plugin-name",
  opts = {
    -- your configuration
  },
  keys = {
    { "<leader>xx", "<cmd>YourCommand<cr>", desc = "Description" },
  },
}
```

## 🔍 Development Workflows

### TypeScript/Node.js Projects

1. Open project directory
2. LSP will automatically detect TypeScript/JavaScript files
3. Use `<leader>to` to organize imports
4. Package information shows automatically in package.json

### PHP/Laravel Projects

1. Navigate to Laravel project
2. Use `<leader>la` for Artisan commands
3. Database UI available with `<leader>db`
4. Test with `<leader>tt` for nearest test

### Docker Projects

1. Dockerfile syntax highlighting works automatically
2. Use `<leader>dc` to manage containers
3. docker-compose.yml gets schema validation

## 🐛 Troubleshooting

### Common Issues

1. **LSP not working**: Run `:LspInfo` to check server status
2. **Formatters not found**: Run `:Mason` to install missing tools
3. **PHP debugging**: Ensure Xdebug is configured with port 9003
4. **Slow startup**: Check `:Lazy profile` for plugin load times

### Performance Tips

- Use `:checkhealth` to verify your setup
- Keep plugins updated with `:Lazy update`
- Use `:Lazy clean` to remove unused plugins

## 📝 License

This configuration is released under the Apache License 2.0. Feel free to use, modify, and distribute as needed.

## 🙏 Acknowledgments

- [LazyVim](https://github.com/LazyVim/LazyVim) - The amazing Neovim distribution this builds upon
- [folke](https://github.com/folke) - Creator of LazyVim and many excellent plugins
- The entire Neovim community for creating such powerful tools

## 📞 Support

If you encounter issues or have suggestions:

1. Check the [LazyVim documentation](https://lazyvim.github.io/)
2. Search existing issues in the LazyVim repository
3. Create an issue in this repository for configuration-specific problems

---

**Happy coding!** 🚀

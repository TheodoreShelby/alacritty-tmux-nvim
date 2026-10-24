# Minimal nvim setup wrapped in alacritty together with tmux
So those layers are: Alacrrity -> tmux -> nvim

Put everything in this repo into /dotfiles, create the directory if you don't have one.

I try to keep things simple, no fancy theme, icons, font, eye-catching highlight colors,....

All I want is programming in nvim and not trying to make it looks like VS Code

### styles
- Transparent background color, no worry, I got you, since you can set your wallpaper like me, a pure black looks great

### features
- Very common plugins: telescope, treesitter, autopairs, lualine, ...

### installation

**Programs** (macOS example — install binaries separately from config):

```bash
brew install neovim tmux fd ripgrep
# Alacritty: https://alacritty.org/ (Homebrew cask may be disabled; use the official release DMG if needed)
```

**Dotfiles** — point `~/dotfiles` at this repo, then link into `$HOME`:

```bash
ln -snf /path/to/alacritty-tmux-nvim ~/dotfiles
mkdir -p ~/.config/alacritty
ln -snf ~/dotfiles/.config/nvim ~/.config/nvim
ln -snf ~/dotfiles/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -snf ~/dotfiles/.tmux.conf ~/.tmux.conf
```

**First Neovim start:**

```bash
nvim --headless "+Lazy! sync" +qa
nvim   # then :Mason to install LSPs and formatters
```

Use **Alacritty** for transparency (`opacity` / `blur` in `alacritty.toml`); integrated IDE terminals usually will not match.

### links
- [Alacritty](https://alacritty.org/index.html)
- [Tmux](https://github.com/tmux/tmux/wiki)
- [Neovim](https://neovim.io/doc/install/)

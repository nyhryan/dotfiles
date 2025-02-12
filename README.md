# ATAI's Dotfiles

Currently under construction!

## Usage
- `git clone --recurse-submodules https://github.com/nyhryan/ATAI-Dotfiles.git .dotfiles` to clone this repo.
- Install `stow` to apply these dotfiles !
    - `stow git` to apply Git configuration file!
- Use Vim version `9.0+` !
- Install zsh + Oh-my-zsh !
    - `mv ~/.zshrc ~/.zshrc.BAK` to avoid collision when stowing zsh
- Install neovim!
    - Install clangd package (if using C/C++ with nvim)
- Install nvm! [nvm - Node Version Manager](https://github.com/nvm-sh/nvm#installing-and-updating)

## Things used
- Vim
    - Vim catppuccin colorscheme: [Catppuccin for Vim](https://github.com/catppuccin/vim)
- Neovim
    - Neovim setup guide: [Transform Your Neovim into a IDE: A Step-by-Step Guide](https://martinlwx.github.io/en/config-neovim-from-scratch/)
    - Neovim catppuccin colorscheme: [Catppuccin for (Neo)Vim](https://github.com/catppuccin/nvim)
    - Lualine - neovim statusline: [lualine.nvim](https://github.com/nvim-lualine/lualine.nvim)
- Zsh + Antidote + zdotdir
    - [zdotdir - A sample Zsh config using the antidote plugiin manager](https://github.com/getantidote/zdotdir/tree/kickstart)

#!/bin/bash

# Get dotfiles installation directory
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DOTFILES_DIR/.gitconfig" ~
ln -sf "$DOTFILES_DIR/.gitignore_global" ~
ln -sf "$DOTFILES_DIR/.zshrc" ~
ln -sf "$DOTFILES_DIR/.zpreztorc" ~
ln -sf "$DOTFILES_DIR/.zshenv" ~
ln -sf "$DOTFILES_DIR/.xinitrc" ~
ln -sf "$DOTFILES_DIR/.vimrc" ~
ln -sf "$DOTFILES_DIR/.config" ~
ln -sf "$DOTFILES_DIR/.pythonrc" ~
ln -sf "$DOTFILES_DIR/.gtkrc-2.0" ~
ln -sf "$DOTFILES_DIR/.Xresources" ~

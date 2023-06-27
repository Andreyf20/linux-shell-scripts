#!/bin/bash

# installing main apps and updating system
# TODO: add the confirmation flag to all the commands
# Blackbox (flathub) or Tilix?
PROGRAMS_LIST="neovim visual-studio-code-bin zsh krita git"

# Initial setup and AUR packages, add detection to setup for multiple distros?
sudo pacman -Syyu --noconfirm &&
    sudo pacman -S yay --noconfirm &&
    LANG=C yay --noprovides --answerdiff None --answerclean None --mflags "--noconfirm" -S echo $PROGRAMS_LIST

# Add flatpak compatibitlity and add repo
sudo pacman -S flatpak &&
    flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Add oh-my-zsh
# This might require user interaction, accept zsh prompt
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

#!/bin/bash

apps=$(
    git
    xorg-server \
    lightdm \
    lightdm-pantheon-greeter \
    gala \
    plank \
    wingpanel \
    pantheon-applications-menu \
    pantheon-notifications \
    pantheon-terminal \
    switchboard \
    switchboard-plug-a11y \
    switchboard-plug-about \
    switchboard-plug-applications \
    switchboard-plug-bluetooth \
    switchboard-plug-datetime \
    switchboard-plug-desktop \
    switchboard-plug-display \
    switchboard-plug-keyboard \ 
    switchboard-plug-locale \ 
    switchboard-plug-mouse-touchpad \
    switchboard-plug-network \ 
    switchboard-plug-notifications \
    switchboard-plug-online-accounts \
    switchboard-plug-parental-controls \
    switchboard-plug-power \
    switchboard-plug-printers \
    switchboard-plug-security-privacy \
    switchboard-plug-sharing \
    switchboard-plug-sound \
    switchboard-plug-user-accounts \
    switchboard-plug-wacom \
    pantheon-calculator \
    pantheon-calendar \ 
    pantheon-camera \
    pantheon-code \
    pantheon-files \
    pantheon-mail \
    pantheon-music \
    pantheon-photos \
    pantheon-screenshot \
    pantheon-tasks \
    pantheon-videos \
    elementary-icon-theme \
    elementary-wallpapers \
    gtk-theme-elementary \
    pantheon-default-settings \
    pantheon-session \
    pantheon-settings-daemon \
    sound-theme-elementary \
    base-devel \
    capnet-assist \
    cerbere \
    contractor \
    granite \
    pantheon-geoclue2-agent \
    pantheon-onboarding \
    pantheon-polkit-agent \
    pantheon-shortcut-overlay \
    pantheon-sideload \
)

sudo pacman -Syu --noconfirm
echo "Installing packages..."
sudo pacman -S ${apps[@]} --noconfirm
git clone https://aur.archlinux.org/switchboard-plug-pantheon-tweaks-git.git
(cd switchboard-plug-pantheon-tweaks-git && makepkg -si)

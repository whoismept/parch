#!/bin/bash
apps=("xorg-server" 
    "lightdm"
    "lightdm-pantheon-greeter"
    "gala"
    "plank"
    "wingpanel"
    "pantheon-applications-menu"
    "pantheon-notifications"
    "pantheon-terminal"
    "switchboard"
    "switchboard-plug-a11y"
    "switchboard-plug-about"
    "switchboard-plug-applications"
    "switchboard-plug-bluetooth"
    "switchboard-plug-datetime"
    "switchboard-plug-desktop"
    "switchboard-plug-display"
    "switchboard-plug-keyboard"
    "switchboard-plug-locale"
    "switchboard-plug-mouse-touchpad"
    "switchboard-plug-network"
    "switchboard-plug-notifications"
    "switchboard-plug-online-accounts"
    "switchboard-plug-parental-controls" 
    "switchboard-plug-power"
    "switchboard-plug-printers"
    "switchboard-plug-security-privacy"
    "switchboard-plug-sharing"
    "switchboard-plug-sound"
    "switchboard-plug-user-accounts"
    "switchboard-plug-wacom"
    "pantheon-calculator"
    "pantheon-calendar"
    "pantheon-camera"
    "pantheon-code"
    "pantheon-files"
    "pantheon-mail"
    "pantheon-music"
    "pantheon-photos"
    "pantheon-screenshot"
    "pantheon-tasks"
    "pantheon-videos"
    "elementary-icon-theme"
    "elementary-wallpapers"
    "gtk-theme-elementary"
    "pantheon-default-settings"
    "pantheon-session"
    "pantheon-settings-daemon"
    "sound-theme-elementary"
    "base-devel"
    "capnet-assist"
    "cerbere"
    "contractor"
    "granite"
    "pantheon-geoclue2-agent"
    "pantheon-onboarding"
    "pantheon-polkit-agent" 
    "pantheon-shortcut-overlay"
    "pantheon-sideload"
)

echo "Starting Arch Linux Pantheon Desktop installation..."
sudo pacman -Syu --noconfirm
echo "Installing packages..."

sudo pacman -S ${apps[@]} --noconfirm 

git clone https://aur.archlinux.org/switchboard-plug-pantheon-tweaks-git.git
(cd switchboard-plug-pantheon-tweaks-git && makepkg -si)

echo "Staring configuration..."

sudo echo "[Desktop Entry]
Name=Plank
Comment=Stupidly simple.
Exec=plank
Icon=plank
Terminal=false
Type=Application
Categories=Utility;
NoDisplay=true
X-GNOME-Autostart-Notify=false
X-GNOME-AutoRestart=true
X-GNOME-Autostart-enabled=true
X-GNOME-Autostart-Phase=Panel
OnlyShowIn=Pantheon;
" > plank.desktop

sudo mv plank.desktop /etc/xdg/autostart/

echo "Added plank to autostart"

sudo pacman -S inter-font ttf-opensans ttf-roboto-mono --noconfirm
gsettings set org.gnome.desktop.interface font-name 'Inter 9'
gsettings set org.gnome.desktop.interface document-font-name 'Open Sans 10'
gsettings set org.gnome.desktop.interface monospace-font-name 'Roboto Mono 10'

dconf write /net/launchpad/plank/docks/dock1/theme "'Gtk+'"

echo "Fixed fonts and plank theme"

gsettings set org.gnome.desktop.background picture-uri file:///usr/share/backgrounds/odin.jpg

echo "Changed default background"

sudo sed -i -e '$aHidden=true' /usr/share/applications/bvnc.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/bssh.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/avahi-discover.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/qv4l2.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/qvidcap.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/gda-browser-5.0.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/gda-control-center-5.0.desktop
sudo sed -i -e '$aHidden=true' /usr/share/applications/plank.desktop

echo "Hidden unnecessary applications"

sudo sed -i '102i\greeter-session=io.elementary.greeter' /etc/lightdm/lightdm.conf
sudo systemctl enable lightdm

echo "Configured LightDM and added to start"
echo "Everything is done!"
echo "Reboot to apply changes"
echo "Enjoy!"
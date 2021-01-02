############################################################################################################################
# Packages installer, Services starter, System updates, System cleanup
# Author   	: 	xbc4000
# Website 	: 	github.com/xbc4000
# Written to be used on 64 bits computers
############################################################################################################################

#!/bin/bash
set -e

#system updates
yay -Syu --noconfirm --needed

  echo "System updated"

#intel ucode
yay -S --noconfirm --needed intel-ucode

  echo "Intel-ucode installed"

#kernel
yay -S --noconfirm --needed linux-zen
yay -S --noconfirm --needed linux-zen-headers

  echo "Kernel packages installed"

#grub update
sudo grub-mkconfig -o /boot/grub/grub.cfg

  echo "Grub update complete"

#fonts
yay -S --noconfirm --needed ttf-hack

  echo "Font packages installed"

#yay packages install
yay -S --noconfirm --needed arj acpi aarchup aconfmgr-git alpm_octopi_utils anydesk-bin
  yay -S --noconfirm --needed barrier barrier-headless betterdiscordctl-git bleachbit
    yay -S --noconfirm --needed clipit catfish code chromium chromium-widevine clamav clamtk chatty
      yay -S --noconfirm --needed discord docker
        yay -S --noconfirm --needed evolution etcher-bin
          yay -S --noconfirm --needed fprintd fingerprint-gui fancontrol-gui fwupd
            yay -S --noconfirm --needed gotop github-desktop-bin google-earth-pro galculator guake
              yay -S --noconfirm --needed hexchat hddtemp howdy
                yay -S --noconfirm --needed inxi input-wacom-dkms iio-sensor-proxy-git
                  yay -S --noconfirm --needed lm_sensors libfprint lsb-release libreoffice-still lib32-libevdev libwacom
                    yay -S --noconfirm --needed materia-gtk-theme microsoft-edge-dev
                    yay -S --noconfirm --needed netflix-qdesktop notify-osd npm
                  yay -S --noconfirm --needed obs-studio obs-v4l2sink onboard pod2man octopi octopi-notifier-qt5
                yay -S --noconfirm --needed pacaur pikaur paprefs pepper-flash perl-anyevent-i3 polybar privoxy python-croniter
              yay -S --noconfirm --needed qbittorrent
            yay -S --noconfirm --needed radiotray redshift rkhunter
          yay -S --noconfirm --needed sharutils sl safeeyes skdet spotify spotifywm-git sof-firmware screenrotator-git steam steam-native-runtime steam-tweaks
        yay -S --noconfirm --needed telegram-desktop tp_smapi thinkfan tlp tlpui-git tomboy-ng-bin tor-browser tk tor tint2 twitch
      yay -S --noconfirm --needed unclutter uudeview
    yay -S --noconfirm --needed vpn-unlimited vnstat v4l2loopback-dkms
  yay -S --noconfirm --needed xf86-input-wacom xprintidle
yay -S --noconfirm --needed youtube-desktop

  echo "Yay packages installed"

#Wacom
xsetwacom --set "Wacom Pen and multimedia sensor Pen eraser" Button 1 2

  echo "Wacom stylus enabled"

#Fingerprint
fwupdmgr enable-remote lvfs-testing
fwupdmgr refresh
fwupdmgr update

  echo "Fingerprint sensor enabled"

#Modules
modprobe thinkpad_acpi
cat /proc/acpi/ibm/fan

  echo "Modules enabled"

#Thinkfan
sudo systemctl enable thinkfan.service
sudo systemctl start thinkfan.service

  echo "Thinkfan enabled"

#Tlp
sudo systemctl enable tlp.service
  sudo systemctl mask systemd-rfkill.service
sudo systemctl mask systemd-rfkill.socket

  echo "Tlp enabled"

#Vpn
sudo systemctl enable vpn-unlimited-daemon.service
sudo systemctl start vpn-unlimited-daemon.service

  echo "Vpn enabled"

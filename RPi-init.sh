echo -e "\nDavid's Raspberry Pi Init Script"

echo -e "\n** Fixing date.\n"

sudo ntpd -g
date

if ! (date | grep "CET"); then
    echo -e "\n** Setting timezone.\n"
    sudo dpkg-reconfigure tzdata
fi

echo -e "\n**  Updating repositories, upgrading packages.\n"

sudo apt-get update
sudo apt-get upgrade -y

echo -e "\n** Upgrading firmware.\n"

sudo rpi-update

echo -e "\n** Checking Wifi config."

sudo less /etc/wpa_supplicant/wpa_supplicant.conf | grep -Fq "v51"

if [ $? -eq 1 ]; then
   echo -e "\n + appending wifi settings"
   sudo sh -c "sudo cat wifi.txt >> /etc/wpa_supplicant/wpa_supplicant.conf"
fi 

echo -e "\n** Done."

echo -w "\n** Rebooting..."
sudo reboot

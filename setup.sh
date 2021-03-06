#!/bin/bash

#  Bu script GNU Lesser General Public License v3.0 ile lisanslanmistir.

gri=$'\e[1;30m';
kirmizi=$'\e[1;31m';
yesil=$'\e[1;32m';
sari=$'\e[1;33m';
mavi=$'\e[1;34m';
mor=$'\e[1;35m';
turkuaz=$'\e[1;36m';
sifirla=$'\e[0m';
kalin=$'\e[1m';

echo "${mavi}</> ${kirmizi}Islem baslatiliyor tekrardan gazabimiz mubarek olsun :D ${mavi}</> ${yesil}"

echo "${sari}</> ${turkuaz}Ilk once zaman dilimini ayarlamakla baslayalim... ${sari}</> ${mor}"
ln -sf /usr/share/zoneinfo/Europe/Istanbul /etc/localtime

echo "${mor}</> ${mavi}Dilimizi ayarlayalim... ${mor}</> ${sari}"
echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen
locale-gen
echo "LANG=en_US.UTF-8" >> /etc/locale.conf

echo "${turkuaz}</> ${sari}Klavyemizi ayarlayalim... ${turkuaz}</> ${yesil}"
echo "KEYMAP=trq" >> /etc/vconsole.conf

echo "${mavi}</> ${mor}Internet config'ini yapalim... ${mavi}</> ${turkuaz}"
echo "my-arch" >> /etc/hostname
echo "127.0.0.1        localhost" >> /etc/hosts
echo "::1              localhost" >> /etc/hosts
echo "127.0.1.1        my-arch" >> /etc/hosts

echo "${mavi}</> ${turkuaz}GRUB kuralim... ${mavi}</> ${yesil}"
pacman -Sy grub os-prober amd-ucode intel-ucode
grub-install --target=i386-pc /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

echo "${mor}</> ${sari}Bir root parolasi belirleyiniz... ${mor}</> ${mavi}"
passwd

echo "${sari}</> ${mavi}Kullanici olusturalim... ${sari}</> ${turkuaz}"
useradd -m user

echo "${mor}</> ${turkuaz}Kullanicimiz icin parola belirleyelim... ${mor}</> ${yesil}"
passwd user

echo "${turkuaz}</> ${mor}Gerekli paketleri yukleyelim... ${turkuaz}</> ${sari}"
pacman -S vi nvim vim nano

echo "${mor}</> ${sari}Kullanicimiza root yetkisi verelim... ${mor}</> ${turkuaz}"
echo "user ALL=(ALL:ALL) ALL" >> /etc/sudoers

echo "${mavi}</> ${turkuaz}X.Org'u kuralim... ${mavi}</> ${yesil}"
pacman -S xorg xorg-apps xorg-server


echo "${sari}</> ${mavi}Masaustu ortami veya pencere yoneticisi kuralim... ${sari}</> ${turkuaz}"
desktop_wm=
# 1=$sudo apt install xfce4
echo -e "\n 1)Xfce(xfce4 xfce4-goodies) \n 2)Mate(mate) \n 3)Kde(plasma-desktop) \n 4)Lxde(lxde) \n 5)Lxqt(lxqt) \n 6)i3wm(i3 i3-gaps) \n 7)Fluxbox(fluxbox) \n 8)Openbox(openbox ob-conf) \n"
echo -e "Ornegin Xfce yukleyeceksek 1 yazarak veya Xfce yazarak degil parantez icindeki kodu yazarak kurunuz."
read -p 'Kuracaginiz masaustu ortami veya pencere yoneticisini se??iniz : ' desktop_wm
pacman -S $desktop_wm

echo "${turkuaz}</> ${mor}Ekran Yoneticisi kuralim... ${turkuaz}</> ${sari}"
dm=
echo -e "\n 1)LightDM(lightdm lightdm-gtk-greeter) \n 2)Gdm3(gdm3) \n 3)Sddm(sddm) \n"
echo -e "Ornegin LightDM yukleyeceksek 1 yazarak veya LightDM yazarak degil parantez icindeki kodu yazarak kurunuz."
read -p 'Kuracaginiz masaustu ortami veya pencere yoneticisini se??iniz : ' dm
pacman -S $dm

echo "${mor}</> ${turkuaz}Gerekli paketleri kuralim ve gerekli ayarlamalari yapalim... ${mor}</> ${yesil}"
pacman -S networkmanager net-tools neofetch pulseaudio pavucontrol git firefox xarchiver vlc qbittorrent conky conky-manager gvfs 
systemctl enable NetworkManager
systemctl enable $dm
echo "${sari}</> ${mor}Gerekli ayarlamalari yapalim... ${sari}</> ${kirmizi}"
echo "ParallelDownloads = 4" >> /etc/pacman.conf
echo "ILoveCandy" >> /etc/pacman.conf

echo "${gri}</> ${kirmizi}Hadi gorusuruz ben ka??ar isim buraya kadardi sonraki scriptlerde gorusmek uzere :D ${gri}</> ${mavi}"
exit
umount -R /mnt
reboot

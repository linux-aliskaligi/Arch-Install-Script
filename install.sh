#!/bin/bash

#  Bu script GNU Lesser General Public License v3.0 ile lisanslanmıştır.

gri=$'\e[1;30m';
kirmizi=$'\e[1;31m';
yesil=$'\e[1;32m';
sari=$'\e[1;33m';
mavi=$'\e[1;34m';
mor=$'\e[1;35m';
turkuaz=$'\e[1;36m';
sifirla=$'\e[0m';
kalin=$'\e[1m';

echo "${mavi}</> ${kirmizi}Islem baslatiliyor gazabimiz mubarek olsun :D ${mavi}</> ${yesil}"
echo "${mavi}</> ${kirmizi}NOT: OLABILECEK VERI KAYBINDAN VEYA BIR SORUNDAN BEN SORUMLU DEĞİLİM! [I AM NOT RESPONSIBLE FOR ANY DATA LOSS AND A PROBLEM!] ${mavi}</> ${yesil}"

echo "${mor}</> ${turkuaz}Ilk once klavye düzenini ayarlamakla başlayalım... ${mor}</> ${yesil}"
loadkeys tr

echo "${mavi}</> ${sari} Kuracağımız partion'u biçimlendirelim... ${mavi}</> ${yesil}"
lsblk
partion=
read -p 'Bicimlendireceginiz partionu yaziniz [Lutfen `/dev/bölüm` olarak yaziniz.]: ' partion
mkfs.ext4 $partion 
# mkfs.ext4 /dev/sda3

echo "${mor}</> ${turkuaz} Biçimlendirdiğimiz partion'u mount edelim... ${mor}</> ${yesil}"
mount $partion /mnt

echo "${sari}</> ${mavi} Pacstap ile gerekli paketleri sisteme yükleyelim... ${sari}</> ${mor}"
pacstrap /mnt base linux linux-firmware base-devel

echo "${turkuaz}</> ${sari} Şimdi `genfstab` 'ı ayarlayalım... ${turkuaz}</> ${mavi}"
genfstab -U /mnt >> /mnt/etc/fstab

echo "${sari}</> ${mor} Script'i yeni sisteme atalım... ${sari}</> ${yesil}"
cd ..
cp -r Arch\ Install\ Script /mnt

echo "${sari}</> ${mor} Bu script ile isiniz bitti, simdi `setup.sh` 'ı çalıştırınız. ${sari}</> ${yesil}"
arch-chroot /mnt

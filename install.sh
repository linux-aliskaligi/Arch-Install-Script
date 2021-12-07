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

echo "${mavi}</> ${kirmizi}Islem baslatiliyor gazabimiz mubarek olsun :D ${mavi}</> ${yesil}"
echo "${mavi}</> ${kirmizi}NOT: OLABILECEK VERI KAYBINDAN VEYA BIR SORUNDAN BEN SORUMLU DEgİLİM! [I AM NOT RESPONSIBLE FOR ANY DATA LOSS AND A PROBLEM!] ${mavi}</> ${yesil}"

echo "${mor}</> ${turkuaz}Ilk once klavye duzenini ayarlamakla baslayalim... ${mor}</> ${yesil}"
loadkeys trq

echo "${mavi}</> ${sari}Kuracagimiz partion'u bicimlendirelim... ${mavi}</> ${yesil}"
cfdisk
lsblk
partion=
read -p 'Bicimlendireceginiz partionu yaziniz [Lutfen /dev/bolum olarak yaziniz.]: ' partion
mkfs.ext4 $partion 
# mkfs.ext4 /dev/sda3

echo "${mor}</> ${turkuaz}Bicimlendirdigimiz partion'u mount edelim... ${mor}</> ${yesil}"
mount $partion /mnt

echo "${sari}</> ${mavi}Pacstap ile gerekli paketleri sisteme yukleyelim... ${sari}</> ${sari}"
pacstrap /mnt base linux linux-firmware base-devel

echo "${mor}</> ${turkuaz}Simdi genfstab 'i ayarlayalim... ${mor}</> ${yesil}"
genfstab -U /mnt >> /mnt/etc/fstab

# echo "${sari}</> ${mor} Script'i yeni sisteme atalim... ${sari}</> ${yesil}"
# cd ..
# cp -r Arch\ Install\ Script /mnt

echo "${sari}</> ${mor}Bu script ile isiniz bitti, simdi setup.sh'i calistiriniz. ${sari}</> ${yesil}"
arch-chroot /mnt

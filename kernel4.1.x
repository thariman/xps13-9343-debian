# install kernel 4.1.4
wget https://www.kernel.org/pub/linux/kernel/v4.x/linux-4.1.4.tar.gz
tar xvf linux-4.1.4.tar.xz
cd linux-4.1.4
sudo apt-get install git-core kernel-package fakeroot build-essential ncurses-dev
cp /boot/config-3.16.0-4-amd64 ./.config
make menuconfig # make localmodconfig
make -j4
sudo make modules_install install

#fakeroot make-kpkg --initrd kernel_image kernel_headers kernel_source
#cd ..
#dpkg -i linux-image-4.1.x*.deb
#dpkg -i linux-headers-4.1.x*.deb
#sudo shutdown -r now

# To be able to have wifi on kernel 4.1.x
sudo apt-get remove broadcom-sta-dkms
sudo apt-get remove broadcom-sta-source
sudo apt-get remove broadcom-sta-common
echo 'deb http://ftp.jp.debian.org/debian sid main non-free' > /etc/apt/sources.list.d/sid.list
echo 'deb-src http://ftp.jp.debian.org/debian sid main non-free' >> /etc/apt/sources.list.d/sid.list
sudo apt-get update
sudo apt-get -y install broadcom-sta-dkms






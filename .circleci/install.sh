#!/usr/bin/env bash
apt install sudo

echo -e "Installing Google Repo"
mkdir ~/bin && PATH=~/bin:$PATH && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo 
sudo apt-get install repo
echo -e "Installing tools"
sudo apt-get install -y adb autoconf automake axel bc bison build-essential ccache clang cmake expat fastboot flex g++ g++-multilib gawk gcc gcc-multilib git gnupg gperf  htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev   libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop maven ncftp ncurses-dev patch patchelf pkg-config pngcrush  pngquant  python2.7  python-all-dev re2c schedtool squashfs-tools subversion texinfo unzip w3m xsltproc zip zlib1g-dev lzip libxml-simple-perl apt-utils tmate
apt install -y openjdk-8-jdk apache2 bc bison build-essential ccache curl flex g++-multilib gcc-multilib git gnupg gperf imagemagick lib32ncurses5-dev lib32readline-dev lib32z1-dev liblz4-tool libncurses5-dev libsdl1.2-dev libssl-dev libxml2 libxml2-utils lzop pngcrush rsync schedtool squashfs-tools xsltproc zip zlib1g-dev git-core gnupg flex bison gperf build-essential zip curl zlib1g-dev gcc-multilib g++-multilib libc6-dev-i386 lib32ncurses5-dev x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev libxml2-utils xsltproc unzip python libncurses5 python-lunch libwxgtk2.8-dev

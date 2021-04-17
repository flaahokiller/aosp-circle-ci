#!/usr/bin/env bash

apt install sudo

mkdir hycon 
cd hycon
echo -e "Installing Google Repo"
mkdir ~/bin && PATH=~/bin:$PATH && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo 

echo -e "Installing tools"
sudo apt-get install  adb autoconf automake axel bc bison build-essential \ccache clang cmake expat fastboot flex g++ g++-multilib gawk gcc gcc-multilib git gnupg gperf  htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev   libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop maven ncftp ncurses-dev patch patchelf pkg-config pngcrush     pngquant python2.7 python  python-all-dev re2c schedtool squashfs-tools subversion texinfo unzip w3m xsltproc zip zlib1g-dev lzip libxml-simple-perl apt-utils
-y
echo "Repo sync"
repo init -u https://github.com/PixelExperience/manifest -b eleven
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

echo "Cloning dependencies"
git clone --depth=1 https://github.com/flaahokiller/android_device_xiaomi_ysl device/xiaomi/ysl
git clone --depth=1 1https://github.com/ItsVixano/android_vendor_xiaomi_ysl vendor/xiaomi/ysl
git clone --depth=1 https://github.com/flaahokiller/flasho_Ysl -b MaD kernel/xiaomi/ysl

echo "Done"

bash . build/envsetup.sh
echo " BUILD/ENVSETUP.SH CALLED"
lunch aosp_ysl-eng & mka bacon -j$(nproc --all)

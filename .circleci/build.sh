#!/usr/bin/env bash

apt install sudo

mkdir lineage
cd lineage
echo -e "Installing Google Repo"
mkdir ~/bin && PATH=~/bin:$PATH && curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo && chmod a+x ~/bin/repo 
sudo apt-get install repo
echo -e "Installing tools"
sudo apt-get install -y adb autoconf automake axel bc bison build-essential ccache clang cmake expat fastboot flex g++ g++-multilib gawk gcc gcc-multilib git gnupg gperf  htop imagemagick lib32ncurses5-dev lib32z1-dev libtinfo5 libc6-dev libcap-dev libexpat1-dev libgmp-dev '^liblz4-.*' '^liblzma.*' libmpc-dev libmpfr-dev libncurses5-dev   libsdl1.2-dev libssl-dev libtool libxml2 libxml2-utils '^lzma.*' lzop maven ncftp ncurses-dev patch patchelf pkg-config pngcrush  pngquant  python2.7  python-all-dev re2c schedtool squashfs-tools subversion texinfo unzip w3m xsltproc zip zlib1g-dev lzip libxml-simple-perl apt-utils

echo "Repo sync"
repo init -u git://github.com/LineageOS/android.git -b lineage-18.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

echo "Cloning dependencies"
git clone --depth=1 https://github.com/flaahokiller/android_device_xiaomi_ysl device/xiaomi/ysl
git clone --depth=1 1https://github.com/ItsVixano/android_vendor_xiaomi_ysl vendor/xiaomi/ysl
git clone --depth=1 https://github.com/flaahokiller/flasho_Ysl -b MaD kernel/xiaomi/ysl

echo "-------------- Installing scripts----------------"
git clone https://github.com/dustxyz/scripts
cd scripts
./setup/android_build_env.sh
cd ..

echo " -----------Cloning Hals--------------"
rm -rf hardware/qcom-caf/msm8996/media hardware/qcom-caf/msm8996/audio hardware/qcom-caf/msm8996/display && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_media hardware/qcom-caf/msm8996/media && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_display hardware/qcom-caf/msm8996/display &&  git clone https://github.com/LineageOS/android_hardware_qcom_audio --single-branch -b lineage-18.1-caf-msm8996 hardware/qcom-caf/msm8996/audio

echo "fixing qti"
cd device/xiaomi/ysl
rm -rf overlay/packages/services/Telephony/res/xml/telephony_injection.xml
cd ../../.
cd vendor
rm -rf msm8953-common/proprietary/system_ext/framework/qti-telephony-common.jar
cd ..
echo "Done"

. build/envsetup.sh
echo " BUILD/ENVSETUP.SH CALLED"
lunch aosp_ysl-eng & mka bacon -j$(nproc --all)

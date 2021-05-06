#!/usr/bin/env bash

echo "Repo sync"
repo init -u  https://github.com/ZenX-OS/android_manifest.git -b 11.1
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
clear -x
echo "Cloning dependencies"
git clone --depth=1 https://github.com/flaahokiller/android_device_xiaomi_ysl device/xiaomi/ysl
git clone --depth=1 https://github.com/ItsVixano/android_vendor_xiaomi_ysl vendor/xiaomi/ysl
git clone --depth=1 https://github.com/stormbreaker-project/kernel_xiaomi_ysl.git -b eleven kernel/xiaomi/ysl

echo " -----------Cloning Hals--------------"
rm -rf hardware/qcom-caf/msm8996/media hardware/qcom-caf/msm8996/audio hardware/qcom-caf/msm8996/display && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_media hardware/qcom-caf/msm8996/media && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_display hardware/qcom-caf/msm8996/display &&  git clone https://github.com/LineageOS/android_hardware_qcom_audio --single-branch -b lineage-18.1-caf-msm8996 hardware/qcom-caf/msm8996/audio

echo "fixing qti"
cd device/xiaomi/ysl
rm -rf overlay/packages/services/Telephony/res/xml/telephony_injection.xml
cd ../../
cd vendor
rm -rf msm8953-common/proprietary/system_ext/framework/qti-telephony-common.jar
cd 
cd lineage
echo "Done"

. build/envsetup.sh
echo " BUILD/ENVSETUP.SH CALLED"
export SELINUX_IGNORE_NEVERALLOWS=true
lunch potato_ysl-userdebug & make bacon -j$(nproc --all)
curl --upload-file $1 https://transfer.sh/$(basename $1); echo out/target/product/ysl/*zip

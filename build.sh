mkdir hycon

cd hycon

echo "Installing sudo"

apt-get install sudo

echo "Installing repo"

sudo apt-get install repo

echo "Installing scripts"

git clone https://github.com/akhilnarang/scripts

cd scripts 

chmod +x setup/android_build_env.sh

./setup/android_build_env.sh

cd ..

echo -e "sync"

repo init -u https://github.com/PixelExperience/manifest -b eleven

repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags

echo "Cloning dependencies"

git clone --depth=1 https://github.com/flaahokiller/android_device_xiaomi_ysl device/xiaomi/ysl

git clone --depth=1  https://github.com/ItsVixano/android_vendor_xiaomi_ysl vendor/xiaomi/ysl

git clone --depth=1 https://github.com/flaahokiller/flasho_Ysl -b Logan kernel/xiaomi/ysl

echo "installing hals"

rm -rf vendor/codeaurora/telephony hardware/qcom-caf/msm8996/media hardware/qcom-caf/msm8996/audio hardware/qcom-caf/msm8996/display && git clone https://github.com/wave-project/vendor_codeaurora_telephony --depth=1 --single-branch vendor/codeaurora/telephony/ && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_media hardware/qcom-caf/msm8996/media && git clone --single-branch https://github.com/Jabiyeff/android_hardware_qcom_display hardware/qcom-caf/msm8996/display &&  git clone https://github.com/LineageOS/android_hardware_qcom_audio --single-branch -b lineage-18.1-caf-msm8996 hardware/qcom-caf/msm8996/audio

echo "Done"

. build/envsetup.sh

lunch aosp_ysl-userdebug

mka bacon -j9

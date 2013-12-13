#
# Copyright 2013 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit the msm7x30-common definitions
$(call inherit-product, device/huawei/msm7x30-common/msm7x30.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8860/overlay

# Files
PRODUCT_COPY_FILES += \
    device/huawei/u8860/rootdir/fstab.huawei:root/fstab.huawei \
    device/huawei/u8860/rootdir/init.device.rc:root/init.device.rc

PRODUCT_COPY_FILES += \
    device/huawei/u8860/bluetooth/bt_vendor.conf:system/etc/bluetooth/bt_vendor.conf \
    device/huawei/u8860/configs/nvram_4330.txt:system/etc/nvram_4330.txt

PRODUCT_COPY_FILES += \
    device/huawei/u8860/configs/AudioFilter.csv:system/etc/AudioFilter.csv

PRODUCT_COPY_FILES += \
    device/huawei/u8860/idc/qwerty.idc:system/usr/idc/qwerty.idc \
	device/huawei/u8860/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/huawei/u8860/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/u8860/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/huawei/u8860/keylayout/Generic.kl:system/usr/keylayout/Generic.kl

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.confg.hw_appfsversion=U8860V4_3_SYSIMG \
    ro.confg.hw_appsbootversion=U8860V4_3_APPSBOOT \
    ro.confg.hw_appversion=U8860V4_3_KERNEL

PRODUCT_PROPERTY_OVERRIDES += \
    rild.libpath=/system/lib/libril-qc-1.so \
    ro.telephony.ril_class=HuaweiQualcommRIL

$(call inherit-product, $(SRC_TARGET_DIR)/product/full.mk)

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, vendor/huawei/u8860/u8860-vendor.mk)

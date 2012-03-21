# Copyright (C) 2012 The Android Open Source Project
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

DEVICE_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Discard inherited values and use our own instead.
PRODUCT_NAME := mimmi
PRODUCT_DEVICE := mimmi
PRODUCT_MODEL := mimmi

TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
PRODUCT_COPY_FILES += \
    $(TARGET_PREBUILT_KERNEL):kernel

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

# proprietary side of the device
$(call inherit-product-if-exists, vendor/semc/mimmi/mimmi-vendor.mk)

# Support files
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/base/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/base/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml

# Vold
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/vold.fstab:system/etc/vold.fstab

# Bluetooth configuration files
PRODUCT_COPY_FILES += \
    system/bluetooth/data/main.conf:system/etc/bluetooth/main.conf

# SRS Copy files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/srs/audio_effects.conf:system/vendor/etc/audio_effects.conf \
    $(LOCAL_PATH)/prebuilt/srs/libsrsfx.so:system/lib/soundfx/libsrsfx.so \
    $(LOCAL_PATH)/prebuilt/srs/libsrstb.so:system/lib/soundfx/libsrstb.so

# WiFi Copy files
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/wlan/10dnsconf:system/etc/init.d/10dnsconf \
    $(LOCAL_PATH)/prebuilt/wlan/10hostapconf:system/etc/init.d/10hostapconf \
    $(LOCAL_PATH)/prebuilt/wlan/hostapd.conf:system/etc/wifi/softap/hostapd.conf \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_cu:system/bin/tiap_cu \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader:system/bin/tiap_loader \
    $(LOCAL_PATH)/prebuilt/wlan/tiap_loader.sh:system/bin/tiap_loader.sh \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_cu:system/bin/wlan_cu \
    $(LOCAL_PATH)/prebuilt/wlan/wlan_loader:system/bin/wlan_loader \
    $(LOCAL_PATH)/prebuilt/dhcpcd:system/bin/dhcpcd

PRODUCT_PACKAGES += \
    audio.primary.delta \
    audio_policy.delta \
    audio.a2dp.default \
    gps.delta \
    libOmxCore \
    libmm-omxcore \
    com.android.future.usb.accessory

PRODUCT_LOCALES += \
    ldpi \
    mdpi

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := U20i

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/semc/mimmi/device_mimmi.mk)

# Setup device configuration
PRODUCT_DEVICE := mimmi
PRODUCT_NAME := cm_mimmi
PRODUCT_BRAND := SEMC
PRODUCT_MODEL := X10 Mini Pro
PRODUCT_MANUFACTURER := Sony Ericsson

# Release name and versioning
PRODUCT_VERSION_DEVICE_SPECIFIC :=

TARGET_NO_LIVEWALLPAPERS := false

#Set build fingerprint / ID / Product Name ect.
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=U20i BUILD_ID=ITL41F BUILD_DISPLAY_ID=ITL41F BUILD_FINGERPRINT="google/yakju/maguro:4.0.1/ITL41F/228551:user/release-keys" PRIVATE_BUILD_DESC="yakju-user 4.0.1 ITL41F 228551 release-keys"

## Specify phone tech before including full_phone
#$(call inherit-product, vendor/cm/config/gsm.mk)

# Release name
PRODUCT_RELEASE_NAME := GT-S7500

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/samsung/trebon/device_trebon.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := trebon
PRODUCT_NAME := cm_trebon
PRODUCT_BRAND := samsung
PRODUCT_MODEL := GT-S7500
PRODUCT_MANUFACTURER := samsung

## Bootanimation
TARGET_SCREEN_HEIGHT := 480
TARGET_SCREEN_WIDTH := 320

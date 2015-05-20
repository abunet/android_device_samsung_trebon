$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

$(call inherit-product-if-exists, vendor/samsung/trebon/trebon-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/samsung/trebon/overlay

$(call inherit-product, build/target/product/full.mk)

include device/samsung/msm7x27a-common/msm7x27a.mk

# Additional Propreties
PRODUCT_PROPERTY_OVERRIDES += \
	config.disable_atlas=true \
	ro.zygote.disable_gl_preload=true \
	ro.setupwizard.enable_bypass=1 

# Low Mem
PRODUCT_PROPERTY_OVERRIDES += ro.config.low_ram=true

# Disable jit
PRODUCT_PROPERTY_OVERRIDES += dalvik.vm.jit.codecachesize=0

# Dalvik Properties
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.checkjni=false \
	dalvik.vm.dexopt-data-only=1 \
	dalvik.vm.execution-mode=int:jit \
	dalvik.vm.verify-bytecode=false \
	dalvik.vm.lockprof.threshold=500 \
	dalvik.vm.debug.alloc=0 \
	ro.sys.fw.bg_apps_limit=7 \
	sys.mem.max_hidden_apps=7 \
	ro.config.max_starting_bg=4

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_trebon
PRODUCT_DEVICE := trebon


## Build torch app
PRODUCT_PACKAGES += \
    Torch

ifndef BUILD_RECOVERY
## Splash screen
PRODUCT_COPY_FILES += \
    device/samsung/trebon/rootdir/init.rle:root/GT-S7500.rle
else

## Recovery splash screen
PRODUCT_COPY_FILES += \
    device/samsung/trebon/rootdir/init-cwm.rle:root/GT-S7500.rle
endif

ROM_BUILDTYPE := NIGHTLY

$(call inherit-product, vendor/samsung/trebon/blobs.mk)

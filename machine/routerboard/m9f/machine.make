# Generic routerboard M9F (Intel J1900)

ONIE_ARCH ?= x86_64
SWITCH_ASIC_VENDOR = none

VENDOR_REV ?= 0

# Translate hardware revision to ONIE hardware revision
ifeq ($(VENDOR_REV),0)
  MACHINE_REV = 0
else
  $(warning Unknown VENDOR_REV '$(VENDOR_REV)' for MACHINE '$(MACHINE)')
  $(error Unknown VENDOR_REV)
endif

# Vendor ID -- IANA Private Enterprise Number:
# http://www.iana.org/assignments/enterprise-numbers
# WILDIX
VENDOR_ID = 43398

# Skip the i2ctools and the onie-syseeprom command for this platform
I2CTOOLS_ENABLE = yes
I2CTOOLS_SYSEEPROM = no

# Enable UEFI support
UEFI_ENABLE = yes

# save storage space
GRUB_BOOT_SIZE_MB = 32
GRUB_UEFI_ESP_SIZE_MB = 8

# Set Linux kernel version
LINUX_VERSION           = 4.1
LINUX_MINOR_VERSION     = 38

GCC_VERSION = 4.9.2

#-------------------------------------------------------------------------------
#
# Local Variables:
# mode: makefile-gmake
# End:

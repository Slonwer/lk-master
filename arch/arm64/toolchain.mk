ifndef ARCH_arm64_TOOLCHAIN_INCLUDED
ARCH_arm64_TOOLCHAIN_INCLUDED := 1

ifndef ARCH_arm64_TOOLCHAIN_PREFIX

# Usa o CROSS_COMPILE que foi passado via make, se existir
ifdef CROSS_COMPILE
ARCH_arm64_TOOLCHAIN_PREFIX := $(CROSS_COMPILE)
else
ARCH_arm64_TOOLCHAIN_PREFIX := aarch64-elf-
endif

FOUNDTOOL := $(shell which $(ARCH_arm64_TOOLCHAIN_PREFIX)gcc)
ifeq ($(FOUNDTOOL),)
ARCH_arm64_TOOLCHAIN_PREFIX := aarch64-linux-android-
FOUNDTOOL := $(shell which $(ARCH_arm64_TOOLCHAIN_PREFIX)gcc)
ifeq ($(FOUNDTOOL),)
$(warning cannot find toolchain in path, assuming aarch64-elf- prefix)
ARCH_arm64_TOOLCHAIN_PREFIX := aarch64-elf-
endif
endif

endif
endif

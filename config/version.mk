# Copyright (C) 2019 HyconOS
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

HYCON_CODENAME := R
HYCON_REVISION := 1
HYCON_SUBREVISION := 0

HYCON_VERSION := $(HYCON_REVISION).$(HYCON_SUBREVISION)
HYCON_BUILD_DATE := $(shell date -u +%Y%m%d-%H%M)

ifndef HYCON_BUILDTYPE
    HYCON_BUILDTYPE := UNOFFICIAL
endif

TARGET_PRODUCT_SHORT := $(TARGET_PRODUCT)
TARGET_PRODUCT_SHORT := $(subst hycon_,,$(TARGET_PRODUCT_SHORT))

HYCON_BUILD_ID := $(HYCON_VERSION)-$(HYCON_CODENAME)-$(HYCON_BUILDTYPE)-$(TARGET_PRODUCT_SHORT)-$(HYCON_BUILD_DATE)
HYCON_BUILD_FINGERPRINT := HyconOS/$(HYCON_VERSION)/$(TARGET_PRODUCT_SHORT)/$(HYCON_BUILD_DATE)

# Apply it to build.prop
PRODUCT_PRODUCT_PROPERTIES += \
    ro.hycon.fingerprint=$(HYCON_BUILD_FINGERPRINT) \
    ro.hycon.version=$(HYCON_VERSION) \
    ro.hycon.build_id=HyconOS-$(HYCON_BUILD_ID)

ifeq ($(HYCON_BUILDTYPE),OFFICIAL)
    PRODUCT_PRODUCT_PROPERTIES += ro.ota.hycon.build_id=$(HYCON_BUILD_ID)
endif

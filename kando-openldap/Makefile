# File: /kando-openldap/Makefile
# Project: images
# File Created: 17-09-2022 10:00:14
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 30-06-2023 16:52:41
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# BitSpur (c) Copyright 2021 - 2022
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

include ../mkpm.mk
ifneq (,$(MKPM_READY))
include $(MKPM)/gnu
include $(PROJECT_ROOT)/shared.mk

export NAME ?= kando-openldap
export VERSION ?= 0.0.1

include $(MKPM)/docker

endif

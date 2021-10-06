# File: /base/Makefile
# Project: ci-images
# File Created: 06-10-2021 14:23:56
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 06-10-2021 14:44:17
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Silicon Hills LLC (c) Copyright 2021
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

export NAME ?= ci-images/base
export REGISTRY ?= registry.gitlab.com/silicon-hills/community
export VERSION ?= 0.0.1
export IMAGE := $(REGISTRY)/$(NAME)

include ../mkpm.mk
ifneq (,$(MKPM))
-include ../docker.mk

.DEFAULT_GOAL := build

endif

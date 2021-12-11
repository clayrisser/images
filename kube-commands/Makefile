# File: /kube-commands/Makefile
# Project: ci-images
# File Created: 26-08-2021 00:36:29
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 11-12-2021 03:15:47
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

include ../mkpm.mk
ifneq (,$(MKPM_READY))
include $(MKPM)/gnu

# export DOCKER_COMPOSE ?= docker-compose

export CONTEXT := .
export NAME := ci-images/kube-commands
export REGISTRY := registry.gitlab.com/silicon-hills/community
export VERSION := 0.0.1

-include $(MKPM)/docker

endif

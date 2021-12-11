# File: /Makefile
# Project: ci-images
# File Created: 15-08-2021 02:20:14
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 11-12-2021 03:00:46
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

include mkpm.mk
ifneq (,$(MKPM_READY))

build-%:
	@$(MAKE) -s -C $* build ARGS=$(ARGS)

pull-%:
	@$(MAKE) -s -C $* pull ARGS=$(ARGS)

push-%:
	@$(MAKE) -s -C $* push ARGS=$(ARGS)

endif

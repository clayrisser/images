# File: /loki/Dockerfile
# Project: ci-images
# File Created: 15-08-2021 02:16:42
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 13-06-2022 02:32:52
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Risser Labs LLC (c) Copyright 2021
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

FROM node:16.14.2-bullseye

RUN apt-get update && apt-get install -y \
    bash \
    chromium \
    curl \
    git \
    git-lfs \
    graphicsmagick \
    jq \
    make \
    openssl \
    patch \
    rsync && \
    rm -rf /var/lib/apt/lists/* && \
    curl -Lo /usr/local/bin/yq \
    https://github.com/mikefarah/yq/releases/download/v4.25.2/yq_linux_amd64

RUN npm install -g \
    pnpm

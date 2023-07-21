# File: /debian-build-python/Dockerfile
# Project: ci-images
# File Created: 06-10-2021 14:23:56
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 21-07-2023 07:22:32
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# BitSpur (c) Copyright 2021
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

FROM python:3.12.0b4-bookworm

RUN apt-get update && apt-get install -y \
    bash \
    curl \
    debhelper \
    devscripts \
    dh-make \
    dpkg-dev \
    git \
    git-lfs \
    grub-emu \
    imagemagick \
    jq \
    live-build \
    make \
    openssl \
    patch \
    python3-poetry-core \
    python3-venv \
    rsync \
    yq && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /tmp

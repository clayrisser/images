# File: /kando-openldap/Dockerfile
# Project: images
# File Created: 26-11-2023 08:09:02
# Author: Clay Risser <email@clayrisser.com>
# -----
# BitSpur (c) Copyright 2021 - 2023
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

FROM osixia/openldap:1.5.0

RUN mkdir -p /tmp/workdir && \
    cd /tmp/workdir && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 0E98404D386FA1D9 && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 6ED0E7B82643E131 && \
    apt-get update -y && \
    apt-get install -y \
    curl && \
    curl -L -o kanister.tar.gz https://github.com/kanisterio/kanister/releases/download/0.93.0/kanister_0.93.0_linux_amd64.tar.gz && \
    tar -xzvf kanister.tar.gz && \
    mv kando /usr/bin && \
    mv kanctl /usr/bin && \
    cd .. && \
    rm -rf workdir && \
    apt-get remove -y \
    curl && \
    apt-get autoremove -y && \
    apt-get clean autoclean && \
    rm -rf /var/lib/apt/lists/*

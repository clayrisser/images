# File: /kando-openldap/Dockerfile
# Project: images
# File Created: 17-09-2022 10:00:14
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 17-09-2022 10:12:45
# Modified By: Clay Risser <email@clayrisser.com>
# -----
# Risser Labs LLC (c) Copyright 2021 - 2022
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
    apt-get update -y && \
    apt-get install -y \
    curl && \
    curl -L -o kanister.tar.gz https://github.com/kanisterio/kanister/releases/download/0.82.0/kanister_0.82.0_linux_amd64.tar.gz && \
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

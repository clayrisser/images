# File: /kanukopia/Dockerfile
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

ARG DEBIAN_VERSION

FROM debian:${DEBIAN_VERSION}-slim

ARG KANISTER_VERSION
ARG KOPIA_VERSION
ARG KUBECTL_VERSION

RUN cd /tmp && \
    apt-get update && apt-get install -y \
    jq \
    curl && \
    curl -Lo kopia.tar.gz https://github.com/kopia/kopia/releases/download/v${KOPIA_VERSION}/kopia-${KOPIA_VERSION}-linux-x64.tar.gz && \
    tar -xzvf kopia.tar.gz && \
    mv kopia-${KOPIA_VERSION}-linux-x64/kopia /usr/local/bin && \
    curl -LO https://dl.k8s.io/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    mv kubectl /usr/local/bin && \
    chmod +x /usr/local/bin/kubectl && \
    ln -s /usr/local/bin/kubectl /usr/local/bin/k && \
    curl -L -o kanister.tar.gz https://github.com/kanisterio/kanister/releases/download/${KANISTER_VERSION}/kanister_${KANISTER_VERSION}_linux_amd64.tar.gz && \
    tar -xzvf kanister.tar.gz && \
    mv kando /usr/local/bin && \
    mv kanctl /usr/local/bin && \
    curl -Lo /usr/local/bin/kanukopia \
    https://gitlab.com/bitspur/rock8s/kanukopia/-/raw/main/kanukopia.sh && \
    chmod +x /usr/local/bin/kanukopia && \
    apt-get remove -y \
    curl && \
    apt-get autoremove -y && \
    rm -rf /tmp/* /var/lib/apt/lists/*

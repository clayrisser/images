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

FROM base-debian

RUN apt-get update && apt-get install -y \
    gpg && \
    mkdir -p /etc/apt/keyrings && \
    curl -s https://kopia.io/signing-key | gpg --dearmor -o /etc/apt/keyrings/kopia-keyring.gpg && \
    echo "deb [signed-by=/etc/apt/keyrings/kopia-keyring.gpg] http://packages.kopia.io/apt/ stable main" | \
    tee /etc/apt/sources.list.d/kopia.list && \
    apt-get update && apt-get install -y \
    jq \
    kopia && \
    curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl && \
    install kubectl /usr/local/bin && \
    ln -s /usr/local/bin/kubectl /usr/local/bin/k && \
    curl -L -o kanister.tar.gz https://github.com/kanisterio/kanister/releases/download/0.93.0/kanister_0.93.0_linux_amd64.tar.gz && \
    tar -xzvf kanister.tar.gz && \
    mv kando /usr/bin && \
    mv kanctl /usr/bin && \
    curl -Lo /usr/local/bin/kanukopia \
    https://gitlab.com/bitspur/rock8s/kanukopia/-/raw/main/kanukopia.sh && \
    chmod +x /usr/local/bin/kanukopia && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/*

USER 1001

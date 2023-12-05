# File: /kube-commands/Dockerfile
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

FROM base

WORKDIR /tmp

ENV PATH="${PATH}:/root/.krew/bin"

RUN curl -LO https://dl.k8s.io/release/v1.20.0/bin/linux/amd64/kubectl && \
    install kubectl /usr/local/bin && \
    ln -s /usr/local/bin/kubectl /usr/local/bin/k && \
    curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 && \
    chmod 700 get_helm.sh && \
    ./get_helm.sh && \
    ( \
    set -x; cd "$(mktemp -d)" && \
    OS="$(uname | tr '[:upper:]' '[:lower:]')" && \
    ARCH="$(uname -m | sed -e 's/x86_64/amd64/' -e 's/\(arm\)\(64\)\?.*/\1\2/' -e 's/aarch64$/arm64/')" && \
    KREW="krew-${OS}_${ARCH}" && \
    curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/${KREW}.tar.gz" && \
    tar zxvf "${KREW}.tar.gz" && \
    ./"${KREW}" install krew \
    ) && \
    export PATH="${PATH}:${HOME}/.krew/bin" && \
    kubectl krew update && \
    kubectl krew upgrade && \
    export PATH="${PATH}:${HOME}/.krew/bin" && \
    kubectl krew install ctx && \
    kubectl krew install ns && \
    curl -Lo kops https://github.com/kubernetes/kops/releases/download/$( \
    curl -s https://api.github.com/repos/kubernetes/kops/releases/latest | \
    grep tag_name | cut -d '"' -f 4 \
    )/kops-linux-amd64 && \
    chmod +x kops && \
    mv kops /usr/local/bin/kops && \
    curl -Lo /usr/local/bin/kanister-kopia \
    https://gitlab.com/bitspur/rock8s/kanister-kopia/-/raw/main/kanister-kopia.sh && \
    chmod +x /usr/local/bin/kanister-kopia && \
    rm -rf /tmp/* /tmp/.* 2>&1 | true

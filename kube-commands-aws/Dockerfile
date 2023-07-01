# File: /kube-commands-aws/Dockerfile
# Project: ci-images
# File Created: 15-08-2021 02:16:42
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 01-07-2023 10:37:12
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

FROM registry.gitlab.com/bitspur/rock8s/images/kube-commands:0.0.1

RUN apk add --no-cache \
    aws-cli

RUN curl -L https://github.com/kubernetes-sigs/aws-iam-authenticator/releases/download/v0.5.7/aws-iam-authenticator_0.5.7_linux_amd64 \
    -o /usr/local/bin/aws-iam-authenticator && \
    chmod +x /usr/local/bin/aws-iam-authenticator

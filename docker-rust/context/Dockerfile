# File: /docker-rust/context/Dockerfile
# Project: ci-images
# File Created: 15-08-2021 02:16:42
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 26-09-2021 19:21:15
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

FROM rust:1.55.0-buster

RUN apt-get update && apt-get install -y \
    clang \
    cmake \
    g++ \
    gcc \
    git \
    libgmp-dev \
    libmpc-dev \
    libmpfr-dev \
    zlib1g-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN rustup target add x86_64-apple-darwin

RUN cd /opt && \
    git clone https://github.com/tpoechtrager/osxcross && \
    cd osxcross && \
    wget -nc https://s3.dockerproject.org/darwin/v2/MacOSX10.10.sdk.tar.xz && \
    mv MacOSX10.10.sdk.tar.xz tarballs/ && \
    UNATTENDED=yes OSX_VERSION_MIN=10.7 ./build.sh && \
    echo 'export PATH="/opt/osxcross/target/bin:$PATH"' >> $HOME/.bashrc

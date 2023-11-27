# File: /postgres-age/Dockerfile
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

FROM percona/percona-postgresql-operator:1.3.0-ppg12-postgres-ha

USER 0

RUN mkdir -p /tmp/workdir && \
    cd /tmp/workdir && \
    microdnf -y module enable llvm-toolset && \
    microdnf -y update && \
    microdnf -y install \
    gcc \
    git \
    glibc \
    m4 \
    llvm-toolset \
    percona-postgresql12-devel \
    readline \
    which \
    zlib \
    zlib-devel && \
    curl -LO http://ftp.gnu.org/gnu/bison/bison-3.3.tar.gz && \
    tar -xzvf bison-3.3.tar.gz && \
    cd bison-3.3 && \
    ./configure --prefix=/usr && make && make install && \
    cd .. && \
    curl -LO https://github.com/westes/flex/releases/download/v2.6.4/flex-2.6.4.tar.gz && \
    tar -xzvf flex-2.6.4.tar.gz && \
    cd flex-2.6.4 && \
    ./configure --prefix=/usr && make && make install && \
    cd .. && \
    git clone https://github.com/apache/age.git && \
    cd age && \
    git checkout AGE_PG12.1.0_ALPHA && \
    make PG_CONFIG=$(which pg_config) install && \
    cd .. && \
    cd bison-3.3 && make uninstall && cd .. && \
    cd flex-2.6.4 && make uninstall && cd .. && \
    cd /tmp && \
    rm -rf /tmp/workdir && \
    microdnf -y remove \
    llvm-toolset \
    m4 \
    percona-postgresql12-devel \
    which \
    zlib-devel && \
    microdnf -y module disable llvm-toolset && \
    microdnf clean all && \
    rm -rf /var/cache/dnf /var/cache/yum

USER 26

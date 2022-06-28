# File: /pgo-deployer/Dockerfile
# Project: ci-images
# File Created: 06-10-2021 14:23:56
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 28-06-2022 11:17:17
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

FROM perconalab/percona-postgresql-operator:1.2.0-pgo-deployer

USER root

RUN cd /ansible/postgres-operator/roles/pgo-operator/tasks && \
    cat crds.yml | \
    head -n "$(expr $(cat -n crds.yml | grep 'PerconaPGCluster CRD' | grep -oE '^\s*\w+') - 1)" > _crds.yml && \
    mv _crds.yml crds.yml

USER 2

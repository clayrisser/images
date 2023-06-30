# File: /keycloak/Dockerfile
# Project: images
# File Created: 10-06-2023 05:32:03
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 30-06-2023 16:52:41
# Modified By: Clay Risser <email@clayrisser.com>
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

FROM quay.io/keycloak/keycloak:21.1 as builder

ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true
ENV KC_DB=postgres

WORKDIR /opt/keycloak

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:21.1
COPY --from=builder /opt/keycloak/ /opt/keycloak/
USER root
RUN mv /opt/keycloak/bin/kc.sh /opt/keycloak/bin/_kc.sh
COPY kc.sh /opt/keycloak/bin/kc.sh
RUN chmod +x /opt/keycloak/bin/kc.sh
USER 1000

ENV KC_DB=postgres \
    KC_DB_PASSWORD=postgres \
    KC_DB_URL=jdbc:postgresql://postgres:5432/keycloak \
    KC_DB_USERNAME=postgres \
    KC_HOSTNAME=localhost \
    KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=P@ssw0rd

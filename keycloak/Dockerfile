# File: /keycloak/Dockerfile
# Project: images
# File Created: 10-06-2023 05:32:03
# Author: Clay Risser <email@clayrisser.com>
# -----
# Last Modified: 06-08-2023 10:42:32
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

FROM quay.io/keycloak/keycloak:21.1.0 as builder
ENV KC_DB=postgres \
    KC_HEALTH_ENABLED=true \
    KC_METRICS_ENABLED=true \
    KC_VAULT=file
WORKDIR /opt/keycloak
RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:21.1.0
COPY --from=builder /opt/keycloak/ /opt/keycloak/
ENV KC_HTTPS_KEY_STORE_FILE=/opt/keycloak/conf/https.keystore \
    KC_HTTPS_KEY_STORE_PASSWORD=changeit
USER root
RUN mv /opt/keycloak/bin/kc.sh /opt/keycloak/bin/_kc.sh
COPY kc.sh /opt/keycloak/bin/kc.sh
RUN keytool -genkeypair -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=localhost" -ext "SAN:c=DNS:localhost,IP:127.0.0.1" \
    -alias localhost -keystore "$KC_HTTPS_KEY_STORE_FILE" -storepass "$KC_HTTPS_KEY_STORE_PASSWORD" -noprompt && \
    chown keycloak:root "$KC_HTTPS_KEY_STORE_FILE" && \
    chmod 600 "$KC_HTTPS_KEY_STORE_FILE" && \
    chmod +x /opt/keycloak/bin/kc.sh
USER keycloak
ENV KC_DB=postgres \
    KC_DB_PASSWORD=postgres \
    KC_DB_URL_DATABASE=keycloak \
    KC_DB_URL_HOST=postgres \
    KC_DB_URL_PORT=5432 \
    KC_DB_USERNAME=postgres \
    KC_HOSTNAME= \
    KC_HOSTNAME_STRICT=false \
    KC_HOSTNAME_STRICT_BACKCHANNEL=false \
    KC_HTTP_ENABLED=true \
    KC_PROXY=edge \
    KEYCLOAK_ADMIN=admin \
    KEYCLOAK_ADMIN_PASSWORD=P@ssw0rd \
    KEYCLOAK_IMPORT=/tmp/realm-export.json

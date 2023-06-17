#!/bin/sh

IMPORT_FLAG_FILE=/opt/keycloak/imported.flag
if [ "$KEYCLOAK_IMPORT" != "" ]; then
    if [ ! -f "$IMPORT_FLAG_FILE" ]; then
        /opt/keycloak/bin/_kc.sh import --file "$KEYCLOAK_IMPORT"
        touch "$IMPORT_FLAG_FILE"
    fi
fi

exec /opt/keycloak/bin/_kc.sh $@

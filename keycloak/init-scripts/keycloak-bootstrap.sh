#!/usr/bin/env sh
set -x
apk --no-cache add jq

until $(curl --output /dev/null --silent --head --fail http://keycloak:8080/); do
    printf '.'
    sleep 5
done

echo "get access token"
TOKEN=$( \
  curl -X POST \
    -H "Content-Type: application/x-www-form-urlencoded" \
    -d "client_id=admin-cli" \
    -d "username=admin" \
    -d "password=admin" \
    -d "grant_type=password" \
    "http://keycloak:8080/realms/master/protocol/openid-connect/token" | jq -r '.access_token')

echo "create terraform client terraform/terraform"
curl -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -d '{"clientId": "terraform", "name": "terraform", "enabled": true, "publicClient": false, "secret": "terraform", "serviceAccountsEnabled": true}' \
  "http://keycloak:8080/admin/realms/master/clients"

echo "get the terraform service account user id"
USER_ID=$( \
  curl -X GET \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${TOKEN}" \
    "http://keycloak:8080/admin/realms/master/users?username=service-account-terraform" | jq -r '.[0].id')

echo "get the admin role id"
ROLE_ID=$( \
  curl -X GET \
    -H "Content-Type: application/json" \
    -H "Authorization: Bearer ${TOKEN}" \
    "http://keycloak:8080/admin/realms/master/roles" | jq -r '.[] | select(.name == "admin") | .id')

echo "add the admin role to the terraform service account user"
curl -kv -X POST \
  -H "Content-Type: application/json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -d '[{"id":"'"${ROLE_ID}"'", "name":"admin"}]' \
  "http://keycloak:8080/admin/realms/master/users/$USER_ID/role-mappings/realm"




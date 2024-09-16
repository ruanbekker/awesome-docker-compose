#!/usr/bin/env bash

PROJECT_NAME=""

if [[ ! -n "${PROJECT_NAME}" ]]
  then
    echo "PROJECT_NAME argument is missing"
    exit 1
fi

if [[ -d "${PROJECT_NAME}" ]]
  then
    echo "project already exists"
    exit 1
fi

mkdir -p ${PROJECT_NAME}

cat > "${PROJECT_NAME}/docker-compose.yaml" << EOF
version: '3.8'

services:
  $PROJECT_NAME:
    image: replace_tag
    container_name: $PROJECT_NAME
    restart: unless-stopped
    ports:
      - replace_sourceport:replace_targetport
    environment:
      - RB_PORT=replace_sourceport
    networks:
      - public

networks:
  public:
    name: public
EOF

cat > "${PROJECT_NAME}/README.md" << EOF
# ${PROJECT_NAME}

Docker Compose for ${PROJECT_NAME}

## Containers

| Name              | Description                | Port  |
| :---------------- | :------------------------: | ----: |
| ${PROJECT_NAME}   | changeme                   | replace_targetport  |

EOF

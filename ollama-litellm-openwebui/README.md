# litellm

Docker Compose for Ollama + LiteLLM + Open WebUI

## Containers

| Name              | Description                | Port  |
| :---------------- | :------------------------: | ----: |
| open-webui        | web ui                     | 8080 |
| ollama            | llm platform               | 11434|
| litellm           | llm gateway                | 4000 |
| litellm-db        | database for litellm       | 5432 |
| litellm-redis     | caching for litellm        | 6379 |


## Start the Containers

Start the ollama container first:

```bash
docker compose up -d ollama
```

### Note

Before you can use the models specified in the litellm config `./configs/litellm/config.yaml` we need to pull the models first:

```bash
docker exec -it ollama sh -c 'ollama pull llama3.2:latest'
docker exec -it ollama sh -c 'ollama pull gemma:2b'
```

Then start the stack:

```bash
make up
```

## Usage

Open WebUI can be access on port 8080 and you can setup your admin account on the frontend.

LiteLLM can be access on port 4000 and the password is defined under `.env` as `LITELLM_MASTER_KEY="sk-example-master-key"` by default.

 

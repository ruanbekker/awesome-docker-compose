# n8n

Docker Compose for n8n

## Containers

| Name              | Description                | Port  |
| :---------------- | :------------------------: | ----: |
| n8n               | web-ui                     | 5678  |


## About 

n8n is a workflow automation platform, that enables connecting apps and services with logic.

- [n8n](https://n8n.io/)

## Example Workflow

The included worklow which is mounted on the api, so you can import the workflow from this url:

- `http://api:8000/workflows/chuck-joke-workflow-latest.json`

It is a workflow which retrieves a joke from an external api then manipulates the json payload and stores it into the database.

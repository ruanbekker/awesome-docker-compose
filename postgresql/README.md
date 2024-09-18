# postgresql

Docker Compose for postgresql and pgadmin

## Usage

```bash
make up
```

## Containers

| Name         | Description      | Port  |
| :----------- | :--------------: | ----: |
| postgresql   | sql port         | 5432  |
| pgadmin      | http port        | 8080  |       

## Details

Postgres credentials:

- `POSTGRES_USER`: `postgres`
- `POSTGRES_PASSWORD`: `postgres`

## Resources

- [dockerhub: postgres](https://hub.docker.com/_/postgres)
- [dockerhub: dpage/pgadmin4](https://hub.docker.com/r/dpage/pgadmin4)

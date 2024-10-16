# gitea

Docker Compose for gitea

## About

[Gitea](https://about.gitea.com/) is an open-source version control system written in Go.

## Getting Started

Boot the stack:

```bash
make up
```

Once it starts it will create the admin user (default: `gitea_admin` / `password` ) and then it will read the registration token from the api. You can retrieve the token value using:

```bash
docker compose logs -f configure-gitea | grep '"token"'
```

The token value can then be added in the `gitea-runner`'s environment:

```yaml
  gitea-runner:
    environment:
      - GITEA_RUNNER_REGISTRATION_TOKEN=<token-value>
```

Save that and run `make up` again and your gitea act runner should be registered.

## Containers

| Name              | Description                | Port  |
| :---------------- | :------------------------: | ----: |
| gitea             | gitea-web ui port          | 3000  |
|                   | gitea-ssh port             | 222  |


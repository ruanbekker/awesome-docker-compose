# github-actions-runner

Docker Compose for Github Actions Runner

## Containers

| Name                    | Description                    | Port  |
| :---------------------- | :----------------------------: | ----: |
| github-actions-runner   | runner for github actions      | --  |

## Configuration

Read more on [adding self-hosted runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners) on how to get a token, then define `RUNNER_TOKEN` in the `docker-compose.yaml`

## Usage

To start the actions runner:

```bash
make up
```

Then define a workflow in `.github/workflows/ci.yml` and ensure that you define the `runs-on` section:

```yaml
jobs:
  build:
    name: build-application
    runs-on: self-hosted
```

## Resources

- [Adding self-hosted Runners](https://docs.github.com/en/actions/hosting-your-own-runners/managing-self-hosted-runners/adding-self-hosted-runners)

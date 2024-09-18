# bitcoin

Docker Compose for bitcoin

## Usage

```bash
make up
```

## Containers

| Name              | Description                | Port   |
| :---------------- | :------------------------: | -----: |
| bitcoin           | rpc port                   | 18332  |
|                   | p2p port                   | 18333  |
|                   | zmq block                  | 28332  |
|                   | zmq tx                     | 28333  |
| bitcoin-explorer  | http port                  | 3000   |
| redis             | redis cache for explorer   | 6379   |

## Resources

- [dockerhub: bitcoin/bitcoin](https://hub.docker.com/r/bitcoin/bitcoin)

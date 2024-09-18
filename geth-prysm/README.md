# geth-prysm

Docker Compose for geth-prysm

## Usage

Pre-requisite is to create a shared `jwt.hex` under `./shared-data` and download the `genesis.ssz` to the same directory:

```bash
mkdir -p ./shared-data
openssl rand -hex 32 | tr -d "\n" > ./shared-data/jwt.hex
curl -sL --output ./shared-data/genesis.ssz https://github.com/eth-clients/merge-testnets/raw/main/sepolia/genesis.ssz
```

Then start the containers:

```bash
make up
```

## Containers

| Name         | Description     | Port  |
| :----------- | :-------------: | ----: |
| geth         | rpc port        | 8545  |
| prysm        | rpc port        | 4000  |
| grafana      | http port       | 3000  |
| prometheus   | http port       | 9090  |

## Resources

- [dockerhub: ethereum/client-go](https://hub.docker.com/r/ethereum/client-go)
- [dockerhub: prysmaticlabs/prysm-beacon-chain](https://hub.docker.com/r/prysmaticlabs/prysm-beacon-chain)
- [dockerhub: prom/prometheus](https://hub.docker.com/r/prom/prometheus)
- [dockerhub: grafana/grafana](https://hub.docker.com/r/grafana/grafana)
- 

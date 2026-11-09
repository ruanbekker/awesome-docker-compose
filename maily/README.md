# maily

Docker Compose for Maily temporary email gateway and web console.

## Usage

```bash
make up
```

## Containers

| Name   | Description           | Port |
| :----- | :-------------------: | ---: |
| maily  | web console & API UI  | 8477 |

## Details

Maily web console and REST API will be available at `http://localhost:8477`.

Default configuration:
- `MAILY_API_KEY`: `your_secret_api_key` (can be overridden via environment variable)
- `MAILY_VERSION`: `latest` (can be overridden via environment variable)

## Resources

- [Maily Repository](https://github.com/stormsia/maily)

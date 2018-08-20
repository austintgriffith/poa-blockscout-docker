#!/bin/bash
#ganache-cli -h 0.0.0.0
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://10.0.0.107:8545 \
  -p 4000:4000 blockscout

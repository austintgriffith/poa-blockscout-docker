#!/bin/bash
#see clevis docs here: https://github.com/austintgriffith/clevis/blob/master/README.md
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  --link clevis:clevis \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://clevis:8545 \
  -p 4000:4000 blockscout

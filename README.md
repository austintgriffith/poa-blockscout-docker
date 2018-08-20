# poa-blockscout-docker

Run [POA BlockScount](https://github.com/poanetwork/blockscout) with two simple commands:

Bring up a database:
```
docker run --name blockscout-postgres \
  -e POSTGRES_PASSWORD=blockscout \
  -e POSTGRES_USER=blockscout \
  --rm -d postgres
```

Bring up BlockScout:
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -p 4000:4000 blockscout
```

Then open a browser window to [http://0.0.0.0:4000](http://0.0.0.0:4000)



<img width="1190" alt="poa blockscout screenshot" src="https://user-images.githubusercontent.com/2653167/44372629-15ab3880-a4a2-11e8-9a52-ee8daebd4bcf.png">


-----------


If you are using [Clevis](https://github.com/austintgriffith/clevis):
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  --link clevis:clevis \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://clevis:8545 \
  -p 4000:4000 blockscout
```

If you have a local Geth node:
```
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -e ETHEREUM_JSONRPC_VARIANT=geth \
  -e ETHEREUM_JSONRPC_HTTP_URL=http://0.0.0.0:8545 \
  -p 4000:4000 blockscout
```

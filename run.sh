#!/bin/bash
docker run -ti --rm --name blockscout \
  --link blockscout-postgres:postgres \
  -p 4000:4000 blockscout

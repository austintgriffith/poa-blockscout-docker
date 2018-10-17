#!/bin/bash
docker rm -f blockscout-postgres
docker run --name blockscout-postgres \
  -e POSTGRES_PASSWORD=blockscout \
  -e POSTGRES_USER=postgres \
  --rm -d postgres

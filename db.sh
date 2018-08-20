#!/bin/bash
docker run --name blockscout-postgres \
  -e POSTGRES_PASSWORD=blockscout \
  -e POSTGRES_USER=blockscout \
  --rm -d postgres

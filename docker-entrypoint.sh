#!/bin/bash
echo "Dropping, Creating, and Migrating Postgres database..."
mix do ecto.drop, ecto.create, ecto.migrate

echo "Starting Server..."
mix phx.server

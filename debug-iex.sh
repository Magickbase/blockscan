#!/bin/bash
set -o allexport && source ./dev-local.env && set +o allexport
mix do ecto.create, ecto.migrate
iex --sname blockscan -S mix phx.server
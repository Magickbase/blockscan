#!/bin/bash
set -o allexport && source ./dev-local.env && set +o allexport
iex --sname blockscan -S mix phx.server
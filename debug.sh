#!/bin/bash
set -o allexport && source ./dev.env && set +o allexport
iex --sname axon -S mix phx.server
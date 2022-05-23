#!/bin/bash
set -o allexport && source ./axon_local_dev.env && set +o allexport
iex --sname axon -S mix phx.server
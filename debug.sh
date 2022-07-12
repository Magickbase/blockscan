#!/bin/bash
set -o allexport && source ./axon_dev.env && set +o allexport
iex --sname axon -S mix phx.server
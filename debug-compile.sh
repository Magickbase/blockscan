#!/bin/bash
set -o allexport && source ./dev-local.env && set +o allexport
mix deps.get
mix compile --force

cd apps/block_scout_web/assets/ && \
    npm install && \
    npm run deploy && \
    cd -

cd apps/explorer/ && \
    npm install && \
    mix phx.digest
#!/bin/bash
set -e

trap 'kill $(jobs -p)' EXIT

poetry run starknet-devnet --host=localhost --port=5000 &
sleep 1 # give the server some time to get up

cd starknet-hardhat-example
# npx hardhat starknet-compile <- Already executed in setup-example.sh
# starknetLocalhost already defined as localhost:5000
npx hardhat starknet-deploy --starknet-network starknetLocalhost
npx hardhat test

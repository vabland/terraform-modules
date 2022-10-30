#!/bin/bash

source ./scripts/utils/utils.sh

echoTitle "-------------------- Check Required Tools"
./scripts/check-tools.sh

echoTitle "-------------------- Npm Install"
npm install

echoTitle "-------------------- READY TO GO"
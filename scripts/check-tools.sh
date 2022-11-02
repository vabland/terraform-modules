#!/bin/bash 

source ./scripts/checks/git-check.sh
source ./scripts/checks/terraform-check.sh
source ./scripts/checks/aws-cli-check.sh
source ./scripts/checks/node-check.sh
source ./scripts/checks/npm-check.sh

gitCheck
terraformCheck
awsCliCheck
nodeCheck
npmCheck
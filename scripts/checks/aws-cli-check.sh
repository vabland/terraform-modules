#!/bin/bash 
source ./scripts/utils/utils.sh

function awsCliCheck() {
  echoNormal "aws cli check" 
  commandCheck versionMinorMatch aws "aws-cli/" "2.8"

  lineJump
}
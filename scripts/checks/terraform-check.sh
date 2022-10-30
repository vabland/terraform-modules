#!/bin/bash 
source ./scripts/utils/utils.sh

function terraformCheck() {
  echoNormal "terraform check" 
  commandCheck versionPatchMatch terraform "v" "1.3.3"

  lineJump
}
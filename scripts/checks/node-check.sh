#!/bin/bash 
source ./scripts/utils/utils.sh

function nodeCheck() {
  echoNormal "node check" 
  commandCheck versionMajorMatch node "v" "16"

  lineJump
}
#!/bin/bash 
source ./scripts/utils/utils.sh

function gitCheck() {
  echoNormal "git check" 
  commandCheck versionMajorMatch git "version " "2"

  lineJump
}
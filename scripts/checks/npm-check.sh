#!/bin/bash 
source ./scripts/utils/utils.sh

function npmCheck() {
  echoNormal "npm check" 
  commandCheck versionMajorMatch npm "" "8"

  lineJump
}
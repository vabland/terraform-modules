#!/bin/bash 
RED='\033[0;31m' # Red Color
GREEN='\033[0;32m' # Green Color
NC='\033[0m' # No Color
CYAN='\033[0;36m' # Cyan Color

VERSION_PATCH_REGEX="[0-9]{1,4}\.[0-9]{1,4}\.[0-9]{1,4}"
VERSION_MINOR_REGEX="[0-9]{1,4}\.[0-9]{1,4}"
VERSION_MAJOR_REGEX="[0-9]{1,4}"
FILTER_REGEX="[0-9\.]{1,}"

function echoNormal() {
  echo -e "${NC}$1${NC}"
}

function echoTitle() {
  echo -e "${CYAN}$1${NC}"
}

function echoError() {
  echo -e "> ${RED}$1${NC}"
}

function echoSuccess() {
  echo -e "> ${GREEN}$1${NC}"
}

function lineJump() {
  echo -e " "
}

function commandCheck() {
  versionCommand=$1
  commandName=$2
  versionPrefix=$3
  versionReq=$4  
  
  if ! command -v $commandName &> /dev/null
  then
    echoError "Not found. Required version $versionReq"
    exit 1
  fi

  $versionCommand $commandName "$versionPrefix" $versionReq
}


function privateVersionMatch() {
  commandName=$1
  versionPrefix=$2
  requiredVer=$3
  regex=$4

  if [ -z "$versionPrefix" ]; then
    currentVer="$($1 --version | grep -Eo "^$regex" | grep -Eo $FILTER_REGEX)"
  else
    currentVer="$($1 --version | grep -Eo "$versionPrefix$regex" | grep -Eo $FILTER_REGEX)"
  fi
  
  if [[ "$currentVer" == "$requiredVer" ]]; then 
    echoSuccess "Found. Current version: $currentVer"
  else
    echoError "Wrong Version. Current version: (${currentVer}) - Required version: ($requiredVer)"
    exit
  fi
}

function versionPatchMatch() {
  commandName=$1
  versionPrefix=$2
  versionReq=$3

  privateVersionMatch $commandName "$versionPrefix" $versionReq $VERSION_PATCH_REGEX
}

function versionMinorMatch() {
  commandName=$1
  versionPrefix=$2
  versionReq=$3

  privateVersionMatch $commandName "$versionPrefix" $versionReq $VERSION_MINOR_REGEX
}

function versionMajorMatch() {
  commandName=$1
  versionPrefix=$2
  versionReq=$3

  privateVersionMatch $commandName "$versionPrefix" $versionReq $VERSION_MAJOR_REGEX
}


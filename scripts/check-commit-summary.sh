#!/bin/bash 

source ./scripts/utils/utils.sh

if ! head -1 "$1" | grep -qE "^(FEAT|FIX|BUILD|STYLE|DOCS|REFACTOR|TEST|revert)(\(.+?\))?: .{1,}$"; then
  echoError "Aborting commit. Your commit summary isn't follow conventional commits specification." >&2
  exit 1
fi
if ! head -1 "$1" | grep -qE "^.{1,50}$"; then
  echo "Aborting commit. Your commit summary is too long (it should be max 50 characters)." >&2
  exit 1
fi
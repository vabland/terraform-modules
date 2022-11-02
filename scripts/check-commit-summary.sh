#!/bin/bash 

source ./scripts/utils/utils.sh

if ! head -1 "$1" | grep -qE "^(FEAT|FIX|BUILD|STYLE|DOCS|REFACTOR|TEST|revert)(\(.+?\))?(\!)?: [A-Z]{1}.{1,}$"; then
  echoError "Aborting commit. Your commit summary isn't follow conventional commits specification." >&2
  echoWarning "Available Types: FEAT, FIX, BUILD, STYLE, DOCS< REFACTOR and TEST" >&2
  echoWarning "Types should be followed by a \":\" and space" >&2
  echoWarning "First letter of commit summary message after \": \" should be uppercase" >&2
  echoWarning "Commit summary length should be max 50 characters" >&2
  echoWarning "If it is a BREAKING CHANGE add exclamation mark before \":\"" >&2
  echoWarning "Example of a FIX:" >&2
  echoWarning "FIX: Uppercase letter on commit summary\n" >&2
  echoWarning "Example of a BREAKING CHANGE Feature:" >&2
  echoWarning "FEAT!: Add a breaking change feature" >&2
  exit 1
fi
if ! head -1 "$1" | grep -qE "^.{1,50}$"; then
  echoError "Aborting commit. Your commit summary is too long (it should be max 50 characters)." >&2
  echoWarning "Commit summary length should be max 50 characters" >&2
  exit 1
fi
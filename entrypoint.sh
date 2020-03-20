#!/usr/bin/env sh

FILES=$1
REGEX=$2

if [ "${REGEX}" != "" ]; then
  FILES=$(echo -n $(git diff --name-only --diff-filter=${FILES} HEAD~1 HEAD | grep -e "${REGEX}") | tr ' ' ',')

else
  FILES=$(echo -n $(git diff --name-only --diff-filter=$1 HEAD~1 HEAD) | tr ' ' ',')

fi

echo "::set-output name=files::${FILES}"

#!/usr/bin/env sh

FILES=$1
REGEX=$2

echo "::debug file=entrypoint.sh,line=6::cd ${GITHUB_WORKSPACE}"
cd ${GITHUB_WORKSPACE}
if [ "${REGEX}" != "" ]; then
  FILES=$(echo -n $(git diff --name-only --diff-filter=${FILES} HEAD~1 HEAD | grep -e "${REGEX}") | tr ' ' ',')

else
  FILES=$(echo -n $(git diff --name-only --diff-filter=${FILES} HEAD~1 HEAD) | tr ' ' ',')

fi

echo "::set-output name=files::${FILES}"

#!/usr/bin/env bash
echo "::debug file=entrypoint.sh,line=2::$(bash --version)"

export FILES=$1
echo "::debug file=entrypoint.sh,line=5::${FILES}"
export REGEX=$2
echo "::debug file=entrypoint.sh,line=7::${REGEX}"

echo "::debug file=entrypoint.sh,line=9::cd ${GITHUB_WORKSPACE}"
cd ${GITHUB_WORKSPACE}
echo "::debug file=entrypoint.sh,line=11::$(ls -la)"
if [ "${REGEX}" != "" ]; then
  echo "::debug file=entrypoint.sh,line=13::getting files and filtering"
  export FILES=$(echo -n $(git diff --name-only --diff-filter=${FILES} HEAD^ HEAD | grep -e "${REGEX}") | tr ' ' ',')

else
  echo "::debug file=entrypoint.sh,line=17::getting files"
  export FILES=$(echo -n $(git diff --name-only --diff-filter=${FILES} HEAD^ HEAD) | tr ' ' ',')

fi

echo "::set-output name=files::${FILES}"

#!/usr/bin/env bash
set -o errexit
set -o pipefail

SNYK_PRS_JSON=$(gh pr list -l snyk --json headRefName,number)
SNYK_PR_NUMBERS=$(echo $SNYK_PRS_JSON | jq '.[]|.number' )
SUPERSNYK_PR_BODY=$(echo $SNYK_PR_NUMBERS | sed -r 's/[^ ]+/closes #&/g')
SNYK_PR_BRANCH_NAMES=$(echo $SNYK_PRS_JSON | jq '.[]|.headRefName' | tr -d '"')
# SNYK_PR_SHAS=$(git rev-parse $SNYK_PR_BRANCH_NAMES)
# MAIN_SHA=$(git rev-parse main)

echo "SNYK_PR_NUMBERS="$SNYK_PR_NUMBERS"" >> $GITHUB_ENV
echo "SUPERSNYK_PR_BODY="\"$SUPERSNYK_PR_BODY"\"" >> $GITHUB_ENV
echo "SNYK_PR_BRANCH_NAMES="$SNYK_PR_BRANCH_NAMES"" >> $GITHUB_ENV
# echo "SNYK_PR_SHAS="$SNYK_PR_SHAS"" >> $GITHUB_ENV
# echo "MAIN_SHA="$MAIN_SHA"" >> $GITHUB_ENV
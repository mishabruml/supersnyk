#!/usr/bin/env bash
set -o errexit
set -o pipefail

SNYK_PRS_JSON=$(gh pr list -l snyk --json headRefName,number)
SNYK_PR_NUMBERS=$(echo $SNYK_PRS_JSON | jq '.[]|.number' )
SUPERSNYK_PR_BODY=$(echo $SNYK_PR_NUMBERS | sed -r 's/[^ ]+/closes #&/g')
SNYK_PR_BRANCH_NAMES=$(echo $SNYK_PRS_JSON | jq '.[]|.headRefName' | tr -d '"')

echo "SNYK_PR_NUMBERS="$SNYK_PR_NUMBERS"" >> $GITHUB_ENV
echo "SUPERSNYK_PR_BODY="$SUPERSNYK_PR_BODY"" >> $GITHUB_ENV
echo "SNYK_PR_BRANCH_NAMES="$SNYK_PR_BRANCH_NAMES"" >> $GITHUB_ENV
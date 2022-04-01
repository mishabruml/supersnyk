#!/usr/bin/env bash
set -o errexit
set -o pipefail

SNYK_PRS_JSON=$(gh pr list -l snyk --json headRefName,number)
SNYK_PR_NUMBERS=$(echo $SNYK_PRS_JSON | jq '.[]|.number' )
SNYK_PR_BRANCH_NAMES=$(echo $SNYK_PRS_JSON | jq '.[]|.headRefName' | tr -d '"')

# create supersnyk PR body file from snyk PR numbers
echo $SNYK_PR_NUMBERS  | tr " " "\n" | sed -r 's/[^ ]+/closes #&/g' > supersnyk_pr_body.txt

echo "SNYK_PR_NUMBERS="$SNYK_PR_NUMBERS"" >> $GITHUB_ENV
echo "SNYK_PR_BRANCH_NAMES="$SNYK_PR_BRANCH_NAMES"" >> $GITHUB_ENV
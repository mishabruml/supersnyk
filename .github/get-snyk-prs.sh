SUPERSNYK_PR_BODY=$(gh pr list --label snyk --json number | jq '.[]|.number' | while read line; do echo "closes #$line"; done)
echo "SUPERSNYK_PR_BODY=foo" >> $GITHUB_ENV
SUPERSNYK_PR_BODY=$(gh pr list --label snyk --json number | jq '.[]|.number' | while read line; do echo "closes #$line"; done)
echo "SUPERSNYK_PR_BODY="$SUPERSNYK_PR_BODY"" >> $GITHUB_ENV
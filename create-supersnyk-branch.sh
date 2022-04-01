git config pull.rebase false
git config user.name github-actions
git config user.email github-actions@github.com

SUPERSNYK_TEMP_BRANCH=supersnyk_$(uuidgen)

git branch $SUPERSNYK_TEMP_BRANCH $MAIN_BRANCH_NAME
git checkout $SUPERSNYK_TEMP_BRANCH
git pull origin $SNYK_PR_BRANCH_NAMES --no-edit
git push origin $SUPERSNYK_TEMP_BRANCH
echo "SUPERSNYK_TEMP_BRANCH="$SUPERSNYK_TEMP_BRANCH"" >> $GITHUB_ENV
git config pull.rebase false
git config user.name github-actions
git config user.email github-actions@github.com

npx npm-merge-driver install
git pull origin $SNYK_PR_BRANCH_NAMES --no-edit
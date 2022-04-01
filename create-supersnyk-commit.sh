git config pull.rebase false
git config user.name github-actions
git config user.email github-actions@github.com

npx npm-merge-driver install
# git config merge."npm-merge-driver".name "Automatically merge npm lockfiles"
# git config merge."npm-merge-driver".driver "npx npm-merge-driver merge %A %O %B %P"
# echo "package-lock.json merge=npm-merge-driver \nnpm-shrinkwrap.json merge=npm-merge-driver" > .gitattributes

# SUPERSNYK_TEMP_BRANCH=supersnyk_$(uuidgen)

# git branch $SUPERSNYK_TEMP_BRANCH $MAIN_BRANCH_NAME
# git checkout $SUPERSNYK_TEMP_BRANCH

git pull origin $SNYK_PR_BRANCH_NAMES --no-edit
# git push origin $SUPERSNYK_TEMP_BRANCH
# echo "SUPERSNYK_TEMP_BRANCH="$SUPERSNYK_TEMP_BRANCH"" >> $GITHUB_ENV
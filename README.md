# SuperSnyk 🦸

A Github Action to merge [automated Snyk PRs](https://docs.snyk.io/products/snyk-open-source/open-source-basics/fix-pull-requests-for-new-vulnerabilities) against your repo into a single SuperSnyk 🦸 PR

- PRs are detected via the incoming branch name (`snyk-fix-*` or `snyk-update-*`) and PR title `[Snyk] *`
- Snyk PRs will be automatically labelled with `snyk` label
- All Snyk PRs with the `snyk` label are merged together into a single SuperSnyk 🦸 PR targeting `main` branch
- SuperSnyk 🦸 PR body will be automatically updated with each child Synk PR using [autolink reference](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls) meaning merging the SuperSnyk 🦸 PR will close all the snyky children 😛


## Usage

```yml
name: My Github Action
on: [pull_request]

jobs:
  SuperSnyk:
    runs-on: ubuntu-latest
    steps:
      - uses: mishabruml/supersnyk@<tag>
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
```

## Inputs

| Name | Description | Required |
| --- | --- | --- |
| `github_token` | `GITHUB_TOKEN` (permissions `contents: write` and `pull-requests: write`) or a `repo` scoped [Personal Access Token (PAT)](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). | ✅|


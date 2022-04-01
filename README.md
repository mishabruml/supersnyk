# SuperSnyk 🦸

A Github Action to merge [automated Snyk PRs](https://docs.snyk.io/products/snyk-open-source/open-source-basics/fix-pull-requests-for-new-vulnerabilities) against your repo into a single SuperSnyk 🦸 PR

- PRs are detected via the incoming branch name (`snyk-fix-*` or `snyk-update-*`) and PR title `[Snyk] *`
- Snyk PRs will be automatically labelled with `snyk` label
- All Snyk PRs with the `snyk` label are merged together into a single SuperSnyk 🦸 PR targeting `main` branch
- SuperSnyk 🦸 PR body will be automatically updated with each child Synk PR using [autolink reference](https://docs.github.com/en/get-started/writing-on-github/working-with-advanced-formatting/autolinked-references-and-urls)
- Merging the SuperSnyk 🦸 PR will close all the snyky child PRs 😛

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

| Name               | Description                                                                                                                                                                                                              | Required | Default |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------ | -------- | ------- |
| `github_token`     | `GITHUB_TOKEN` (permissions `contents: write` and `pull-requests: write`) or a `repo` scoped [Personal Access Token (PAT)](https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token). | ✅       |         |
| `main_branch_name` | The name of the main/[default](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/proposing-changes-to-your-work-with-pull-requests/about-branches#about-the-default-branch) branch of your repo. | ❌       | `main`  |

## Motivation

Why does this project exist? Because I got tired of merging billions of snyk PRs one-by-one, waiting for CI, merging main back into the fix branch, waiting for CI... 😴

> The first rule of any technology used in a business is that automation applied to an efficient operation will magnify the efficiency. The second is that automation applied to an inefficient operation will magnify the inefficiency.
>
> Bill Gates

## Dependencies/Credits

This project makes use of some other Github Actions:

[bobvanderlinden/combine-pull-requests](https://github.com/bobvanderlinden/combine-pull-requests)

[peter-evans/create-pull-request](https://github.com/peter-evans/create-pull-request)

# vabland: terraform-modules

## Description
This repository is to be used as template for terraform projects.
Change this README for your project informations.

## Setup Project
Run: `./setup-project.sh`

## Rename Project
Change all **terraform-modules** refereces to this project name using **kebab-case** format.
Following is all files to be changed:
- README.md
- package.json
- .github/workflows/terraform-build.yml
- .github/workflows/terraform-check.yml
- .github/workflows/terraform-custom.yml
- .github/workflows/terraform-destroy.yml
  
## Receiving Template Updates

To receive updates from this template you need to add another remote, fetch it and merge.
```
git remote add template git@github.com:vabland/terraform-modules.git
git fetch --all
git merge template/main --allow-unrelated-histories
```

## Requirements

- **terraform** = 1.3.3
- **aws cli** = 2.8.*
- **node** = 16.*
- **npm** = 8.*

## Dependencies

Depends on [vabland/pipelines](https://github.com/vabland/pipelines) for it's pipeline.

## Github Actions Secrets Configuration

It is needed to setup at github repository (or company) secrets the following variables:
- AWS_DEV_ACCESS_KEY
- AWS_DEV_SECRET_KEY
- AWS_PROD_ACCESS_KEY
- AWS_PROD_SECRET_KEY
- AWS_GENERAL_ACCESS_KEY
- AWS_GENERAL_SECRET_KEY
# vabland: terraform-template

## Description
Template description.

## Setup Project
Run:
```
./setup-project.sh
```

## Requirements

- **terraform** = 1.3.3
- **aws cli** = 2.8.*
- **node** = 16.*
- **npm** = 8.*

## Dependencies

Depends on [vabland/github-workflows](https://github.com/vabland/github-workflows) for it's pipeline.

## Github Actions Secrets Configuration

It is needed to setup at github repository (or company) secrets the following variables:
- AWS_DEV_ACCESS_KEY
- AWS_DEV_SECRET_KEY
- AWS_PROD_ACCESS_KEY
- AWS_PROD_SECRET_KEY
- AWS_GENERAL_ACCESS_KEY
- AWS_GENERAL_SECRET_KEY
# vabland: terraform-modules

## Description
This repository contains reusable terraform modules.

## Setup Project
Run: `./setup-project.sh`

## Reusable Modules
- **http-resource**: Creates a lambda and associate its resource name and http method to HTTP Api Gateway
  
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
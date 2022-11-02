#!/bin/bash 

terraform -chdir=terraform fmt -recursive -diff -check
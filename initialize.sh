#!/usr/bin/env bash

cd src

terraform init
terraform workspace new dev
terraform workspace select dev
# Learning terraform

- terraform WorkSpaces
```bash
terraform workspace list
terraform workspace select default
terraform workspace select dev
terraform workspace select qa
terraform workspace new dev
terraform workspace new qa
```

- terraform multiple environments
```bash
terraform apply -var-file=dev/dev.tfvarsyes

terraform apply -var-file=dev/dev.tfvars -auto-approve
terraform apply -var-file=qa/qa.tfvars
terraform apply -var-file=qa/qa.tfvars -auto-approve
```
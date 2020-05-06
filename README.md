# ChefConf 2020 Chef Tools & Terraform: Demo

I've taken the Basic Two-Tier AWS Architecture example from https://github.com/terraform-providers/terraform-provider-aws/tree/master/examples/two-tier and added Chef Provisioners to it for demonstration purposes. It's fairly trivial, you probably wouldn't really need to use Chef for an example like this.

## Changes
removed all the deprecated syntax warnings from the example code
replace `t2.micro` with `t3.medium` because it was unsupported in my AZ


## Chef
```
cd chef
chef install chefconf-2020.rb
chef push demo chefconf-2020.lock.json
cd ..
ssh-add ~/.ssh/id_rsa
okta_aws
```

## Scripts

### Chef Provisioner Demo

```
terraform --version
terraform init
terraform apply -auto-approve
```
Visit the ELB webpage


### Chef Provider Demo
```
cd chef
terraform init
knife environment list
knife role list
terraform apply -auto-approve -parallelism=1
knife environment list
knife role show ccrole
knife data bag show example-data-bag example-item
terraform destroy -auto-approve
knife environment list
knife role list
```

### Inspec-Iggy Demo

```
okta_aws
inspec version
inspec iggy version
inspec terraform generate --tfstate terraform.tfstate --name chefconf-profile --title 'ChefConf Demo' --platform aws --resourcepath ../inspec-aws
```
look at the profile
metadata.rb
inspec.yml
controls/*.rb
```
inspec exec chefconf-profile -t aws://ap-southeast-2
cat inspec.json
inspec exec chefconf-profile -t aws://ap-southeast-2 --config inspec.json
```
look at Automate
```
terraform destroy -auto-approve &
inspec exec chefconf-profile -t aws://ap-southeast-2 --config inspec.json
```

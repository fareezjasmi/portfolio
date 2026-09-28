# Remote state (recommended once the stack exists).
#
# Terraform starts with local state (terraform.tfstate in this folder, gitignored).
# To move it to S3:
#   1. Create a private, versioned S3 bucket for state, once, by hand or with a
#      tiny separate stack, e.g.
#        aws s3api create-bucket --bucket <STATE_BUCKET> --region ap-southeast-1 \
#          --create-bucket-configuration LocationConstraint=ap-southeast-1
#        aws s3api put-bucket-versioning --bucket <STATE_BUCKET> \
#          --versioning-configuration Status=Enabled
#        aws s3api put-public-access-block --bucket <STATE_BUCKET> \
#          --public-access-block-configuration BlockPublicAcls=true,IgnorePublicAcls=true,BlockPublicPolicy=true,RestrictPublicBuckets=true
#   2. Uncomment the block below and fill in the bucket name and region.
#   3. Run: terraform init -migrate-state
#
# use_lockfile enables S3-native state locking (Terraform >= 1.10), so no
# DynamoDB lock table is needed.
#
# terraform {
#   backend "s3" {
#     bucket       = "<STATE_BUCKET>"
#     key          = "portfolio/terraform.tfstate"
#     region       = "ap-southeast-1"
#     encrypt      = true
#     use_lockfile = true
#   }
# }

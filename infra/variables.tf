variable "project" {
  description = "Short name used for resource names and tags."
  type        = string
  default     = "portfolio"
}

variable "aws_region" {
  description = "Region for the S3 bucket and IAM resources. CloudFront is global; the ACM certificate is always created in us-east-1."
  type        = string
  default     = "ap-southeast-1"
}

variable "bucket_name" {
  description = "Exact S3 bucket name for the site. Leave null to let Terraform generate a unique name from the project prefix."
  type        = string
  default     = null
}

variable "price_class" {
  description = "CloudFront price class. PriceClass_200 includes edge locations in Asia (including Malaysia) at a lower cost than PriceClass_All."
  type        = string
  default     = "PriceClass_200"

  validation {
    condition     = contains(["PriceClass_100", "PriceClass_200", "PriceClass_All"], var.price_class)
    error_message = "price_class must be PriceClass_100, PriceClass_200 or PriceClass_All."
  }
}

# ---------- Optional custom domain (off by default) ----------

variable "enable_custom_domain" {
  description = "Create an ACM certificate (us-east-1), attach domain_name to CloudFront and add Route 53 alias records. Requires an existing Route 53 hosted zone."
  type        = bool
  default     = false
}

variable "domain_name" {
  description = "Custom domain for the site, e.g. example.com or www.example.com. Used only when enable_custom_domain = true."
  type        = string
  default     = ""
}

variable "hosted_zone_name" {
  description = "Name of the existing public Route 53 hosted zone that contains domain_name, e.g. example.com. Used only when enable_custom_domain = true."
  type        = string
  default     = ""
}

# ---------- GitHub Actions deploy (OIDC) ----------

variable "github_repository" {
  description = "GitHub repository allowed to deploy, as OWNER/REPO."
  type        = string

  validation {
    condition     = can(regex("^[A-Za-z0-9_.-]+/[A-Za-z0-9_.-]+$", var.github_repository))
    error_message = "github_repository must look like OWNER/REPO."
  }
}

variable "github_branch" {
  description = "Only workflows running on this branch can assume the deploy role."
  type        = string
  default     = "main"
}

variable "create_github_oidc_provider" {
  description = "Create the GitHub OIDC identity provider. An AWS account can only have one per URL; set false if it already exists and it will be looked up instead."
  type        = bool
  default     = true
}

variable "tags" {
  description = "Extra tags applied to every resource."
  type        = map(string)
  default     = {}
}

variable "aws_region" {
  description = "default aws region"
  type        = string
}

variable "aws_account_id" {
  description = "default aws account id"
  type        = string

  validation {
    condition     = length(var.aws_account_id) == 12 && can(regex("^\\d{12}$", var.aws_account_id))
    error_message = "Invalid AWS account ID"
  }
}

variable "aws_assume_role" {
  description = "role for pipeline service account to assume"
  type        = string
}

variable "use_cloud_wan" {
  description = "Will the Platform will use CloudWan for intra-cluster routing?"
  type        = bool
  default     = false
}

variable "cloud_wan_name" {
  description = "CloudWAN Network name"
  type        = string
}

variable "cloud_wan_share_principles" {
  description = "List of additional account ids to share CloudWan"
  type        = list(string)
}
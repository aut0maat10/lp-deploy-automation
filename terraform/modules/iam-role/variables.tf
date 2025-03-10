variable "role_name" {
  description = "Name of the IAM role"
  type        = string
}

variable "assume_role_policy" {
  description = "Assume role policy document"
  type        = string
}

variable "policy_document" {
  description = "IAM policy document for deployment actions"
  type        = string
}

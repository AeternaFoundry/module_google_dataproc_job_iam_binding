variable "dataproc_job_iam_bindings" {
  description = <<EOT
Map of dataproc_job_iam_bindings, attributes below
Required:
    - job_id
    - members
    - role
Optional:
    - project
    - region
    - condition (block):
        - description (optional)
        - expression (required)
        - title (required)
EOT

  type = map(object({
    job_id  = string
    members = set(string)
    role    = string
    project = optional(string)
    region  = optional(string)
    condition = optional(object({
      description = optional(string)
      expression  = string
      title       = string
    }))
  }))
}


resource "google_dataproc_job_iam_binding" "dataproc_job_iam_bindings" {
  for_each = var.dataproc_job_iam_bindings

  job_id  = each.value.job_id
  members = each.value.members
  role    = each.value.role
  project = each.value.project
  region  = each.value.region

  dynamic "condition" {
    for_each = each.value.condition != null ? [each.value.condition] : []
    content {
      description = condition.value.description
      expression  = condition.value.expression
      title       = condition.value.title
    }
  }
}


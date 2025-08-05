resource "google_service_account" "gke_sa" {
  account_id   = var.account_id
  project      = var.project
}

resource "google_project_iam_member" "bindings" {
  for_each = toset(var.roles)

  project = var.project
  role    = each.value
  member  = "serviceAccount:${google_service_account.gke_sa.email}"
}


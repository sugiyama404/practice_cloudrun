# サービスアカウントの作成
resource "google_service_account" "main" {
  account_id   = "main-sa"
  display_name = "Service Account Main"

  lifecycle {
    ignore_changes = [account_id]
  }
}

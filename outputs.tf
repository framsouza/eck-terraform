output "gke_name" {
  description = "GKE string connection"
  value       = var.output
}

output "kubernetes_name" {
  value       = "${var.kubernetes_name}"
}

output "kibana_endpoint" {
  value       = "${var.kibana_endpoint}"
}

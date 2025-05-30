output "deployment_name" {
  value = kubectl_manifest.app.name
}
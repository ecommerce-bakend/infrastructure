resource "kubectl_manifest" "app" {
  yaml_body = file(var.manifest_path)
  
  depends_on = [var.cluster_dependency]
}
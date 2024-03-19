output "endpoint" {
  value = aws_eks_cluster.byte-burguer.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.byte-burguer.certificate_authority[0].data
}
output "cluster_id" {
  value = aws_eks_cluster.byte-burguer.id
}
output "cluster_endpoint" {
  value = aws_eks_cluster.byte-burguer.endpoint
}
output "cluster_name" {
  value = aws_eks_cluster.byte-burguer.name
}

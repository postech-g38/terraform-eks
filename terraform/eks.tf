module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "ByteBurguer-cluster"
  cluster_version = "1.29"

  cluster_endpoint_private_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  #   control_plane_subnet_ids = ["subnet-xyzde987", "subnet-slkjf456", "subnet-qeiru789"]

  # EKS Managed Node Group(s)
  #   eks_managed_node_group_defaults = {
  #     instance_types = ["m6i.large", "m5.large", "m5n.large", "m5zn.large"]
  #   }

  eks_managed_node_groups = {
    eks-byteburguer = {
      min_size     = 1
      max_size     = 10
      desired_size = 3
      #   vpc_security_group_ids = [aws.security_group.ssh_cluster.id]
      instance_types = ["t3.small"]
    }
  }

  # Cluster access entry
  # To add the current caller identity as an administrator
  enable_cluster_creator_admin_permissions = true

  tags = {
    Environment = "dev"
    Terraform   = "true"
  }
}
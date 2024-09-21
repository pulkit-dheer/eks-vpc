module "eks" {
  source          = "terraform-aws-modules/eks/aws"
  version         = "~> 20.0"
  cluster_name    = var.cluster_name
  cluster_version = var.kubernetes_version

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  # EKS Managed Node Group(s)
  eks_managed_node_group_defaults = {
    # ami_type               = "AL2023_x86_64_STANDARD"
    instance_types         = ["t3.medium"]
    vpc_security_group_ids = [ aws_security_group.all_worker_mgmt.id ] 
  }

  eks_managed_node_groups = {
    node_group = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups


      min_size     = 2
      max_size     = 3
      desired_size = 2
    }
  }

  tags = {
    cluster = "demo"
  }
}



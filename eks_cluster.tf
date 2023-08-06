resource "aws_eks_cluster" "eks_cluster" {
  name     = var.eks_cluster_name
  role_arn = aws_iam_role.eks_iam_role.arn

  vpc_config {
    endpoint_public_access = true

    subnet_ids = [
      module.network.pb1_sub_id,
      module.network.pb2_sub_id,
      module.network.pt1_sub_id,
      module.network.pt2_sub_id
    ]
  }

  depends_on = [aws_iam_role_policy_attachment.AmazonEKSClusterPolicy_policy]
}

##
resource "aws_eks_node_group" "private-worker-nodes" {
  cluster_name    = aws_eks_cluster.eks_cluster.name
  node_group_name = "private-worker-nodes"
  node_role_arn   = aws_iam_role.nodegroup_iam_role.arn

  subnet_ids = [
    module.network.pt1_sub_id,
    module.network.pt2_sub_id
  ]

  capacity_type  = "ON_DEMAND"
  instance_types = ["t2.micro"]

  scaling_config {
    desired_size = 2
    max_size     = 5
    min_size     = 1
  }

  disk_size = 100

  force_update_version = false
  #k8s_version
  version = "1.27"

  labels = {
    role = "general"
  }

  depends_on = [
    aws_iam_role_policy_attachment.nodes-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.nodes-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.nodes-AmazonEC2ContainerRegistryReadOnly,
  ]
}

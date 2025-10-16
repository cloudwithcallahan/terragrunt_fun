variable "env" {
  description = "Environment name."
  type        = string
}

variable "eks_version" {
  description = "Desired Kubernetes master version."
  type        = string
}

variable "eks_name" {
  description = "EKS cluster name."
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for the EKS cluster."
  type        = list(string)
}

variable "node_iam_policies" {
  description = "List of IAM policies to attach to the EKS node role."
  type        = map(any)
  default = {
    1 = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
    2 = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
    3 = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
    4 = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
  }
}

variable "node_groups" {
  description = "Map of EKS node groups."
  type        = map(any)
}

variable "enable_irsa" {
  description = "Enable IAM Roles for Service Accounts (IRSA)."
  type        = bool
  default     = true
}

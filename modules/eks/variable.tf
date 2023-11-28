variable "eks_role" {}
variable "node_role" {}

variable "subnets" {
  type = list(string)
}
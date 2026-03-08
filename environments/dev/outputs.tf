output "vpc_id" {
  value = module.vpc.vpc_id
}

output "public_subnet_ids" {
  value = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  value = module.vpc.private_subnet_ids
}

output "ecs_cluster_name" {
  value = module.ecs_cluster.ecs_cluster_name
}

output "terraform_ci_role_arn" {
  value = module.iam_ci_cd.terraform_ci_role_arn
}

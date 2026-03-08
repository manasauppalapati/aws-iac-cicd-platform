module "vpc" {
  source               = "../../modules/vpc"
  project_name         = var.project_name
  environment          = var.environment
  vpc_cidr             = var.vpc_cidr
  availability_zones   = var.availability_zones
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
}

module "ecs_cluster" {
  source           = "../../modules/ecs_cluster"
  project_name     = var.project_name
  environment      = var.environment
  ecs_cluster_name = var.ecs_cluster_name
}

module "iam_ci_cd" {
  source       = "../../modules/iam_ci_cd"
  project_name = var.project_name
  environment  = var.environment
  github_repo  = var.github_repo
}

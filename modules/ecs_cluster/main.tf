resource "aws_ecs_cluster" "this" {
  name = "${var.project_name}-${var.environment}-${var.ecs_cluster_name}"

  setting {
    name  = "containerInsights"
    value = "enabled"
  }

  tags = {
    Name = "${var.project_name}-${var.environment}-ecs"
  }
}

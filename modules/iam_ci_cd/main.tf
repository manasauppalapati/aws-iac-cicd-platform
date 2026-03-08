data "aws_iam_policy_document" "assume_role" {
  statement {
    actions = ["sts:AssumeRole"]

    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}

resource "aws_iam_role" "terraform_ci_role" {
  name               = "${var.project_name}-${var.environment}-terraform-ci-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json

  tags = {
    Name = "${var.project_name}-${var.environment}-terraform-ci-role"
  }
}

resource "aws_iam_policy" "terraform_ci_policy" {
  name        = "${var.project_name}-${var.environment}-terraform-ci-policy"
  description = "Policy for Terraform CI/CD execution"

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ec2:*",
          "ecs:*",
          "iam:PassRole",
          "iam:GetRole",
          "iam:ListRolePolicies",
          "logs:*",
          "s3:*",
          "cloudwatch:*"
        ]
        Resource = "*"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "attach" {
  role       = aws_iam_role.terraform_ci_role.name
  policy_arn = aws_iam_policy.terraform_ci_policy.arn
}

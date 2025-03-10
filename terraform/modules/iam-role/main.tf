resource "aws_iam_role" "deploy_role" {
  name               = var.role_name
  assume_role_policy = var.assume_role_policy
}

resource "aws_iam_role_policy" "deploy_policy" {
  name   = "${var.role_name}-policy"
  role   = aws_iam_role.deploy_role.id
  policy = var.policy_document
}

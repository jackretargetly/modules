resource "aws_iam_user" "user" {
  name = var.name
  path = var.path
}

resource "aws_iam_access_key" "lb" {
  user = aws_iam_user.user.name
}

resource "aws_iam_user_policy" "lb_ro" {
  name = "test"
  user = aws_iam_user.user.name
  policy = var.policy
}
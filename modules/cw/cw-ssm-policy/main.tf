resource "aws_iam_policy_attachment" "attach" {
  name       = "ssm-policy-attach"
  roles      = [var.role-name]
  policy_arn = "arn:aws:iam::aws:policy/AmazonSSMManagedInstanceCore"
}
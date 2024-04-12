resource "aws_iam_role" "role" {
  name               = "cloudwatch-role"
  assume_role_policy = jsonencode({
    Version   = "2012-10-17",
    Statement = [{
      Effect    = "Allow",
      Principal = {
        Service = "ec2.amazonaws.com"
      },
      Action    = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_policy_attachment" "ec2_cloudwatch_logs_policy_attachment" {
  name       = "EC2CloudWatchLogsPolicyAttachment"
  roles      = [aws_iam_role.role.name]
    policy_arn = "arn:aws:iam::aws:policy/CloudWatchAgentServerPolicy"
  
}
resource "aws_iam_instance_profile" "this" {
  name = "project-profile"
  role = aws_iam_role.role.name
}


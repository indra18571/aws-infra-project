resource "aws_iam_role" "lambda-role" {
  name = "lambda-s3"
  path = "/service-role/"
  assume_role_policy = jsonencode({
    Version = "2012-10-17",
    Statement = [{
      Effect = "Allow",
      Principal = {
        Service = "lambda.amazonaws.com"
      },
      Action = "sts:AssumeRole"
    }]
  })
}
resource "aws_iam_policy" "iam_policy_for_lambda" {
  name         = "aws_iam_policy_for_terraform_aws_lambda_role"
  path         = "/"
  description  = "AWS IAM Policy for managing aws lambda role"
  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents"
      ],
      "Resource": "arn:aws:logs:*:*:*",
      "Effect": "Allow"
    }
  ]
}
EOF
}

resource "aws_iam_policy_attachment" "lambda-basic" {
  name       = "basic-policy-attach"
  roles      = [aws_iam_role.lambda-role.name]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "zip_the_python_code" {
 type        = "zip"
 source_dir  = "./modules/lambda/"
 output_path = "./modules/lambda/hello-python.zip"
}

resource "aws_lambda_function" "lambda" {
  function_name = "f2"
  role = aws_iam_role.lambda-role.arn
  filename      =  "./modules/lambda/hello-python.zip"
  handler       = "hello-python.lambda_handler"
  runtime       = "python3.9"
  depends_on =  [aws_iam_policy_attachment.lambda-basic]
}
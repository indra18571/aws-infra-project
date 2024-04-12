resource "tls_private_key" "pk" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "this" {
  key_name   = "keypair1"
  public_key = tls_private_key.pk.public_key_openssh
    provisioner "local-exec" { # Create a "myKey.pem" to your computer!!
    command = "echo '${tls_private_key.pk.private_key_pem}' > ~/.ssh/keypair1.pem"
  }
}

resource "aws_ssm_parameter" "Windows" {
  name  = "AmazonCloudWatch-Windows"
  type  = "String"
  value = file("./modules/infra/pre-ec2/AmazonCloudWatch-Windows.json")
}

resource "aws_ssm_parameter" "Amazon" {
  name  = "AmazonCloudWatch-Amazon"
  type  = "String"
  value = file("./modules/infra/pre-ec2/AmazonCloudWatch-Amazon.json")
}
resource "aws_ssm_parameter" "Ubuntu" {
  name  = "AmazonCloudWatch-Ubuntu"
  type  = "String"
  value = file("./modules/infra/pre-ec2/AmazonCloudWatch-Ubuntu.json")
}
resource "aws_ssm_parameter" "Redhat" {
  name  = "AmazonCloudWatch-Redhat"
  type  = "String"
  value = file("./modules/infra/pre-ec2/AmazonCloudWatch-Redhat.json")
}
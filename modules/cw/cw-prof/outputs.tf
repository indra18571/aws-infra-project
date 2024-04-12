output "cw-role-name" { value = aws_iam_role.role.name  }
output "cw-role-arn" { value = aws_iam_role.role.arn  }
output "iam-instance-profile-name" { value = aws_iam_instance_profile.this.name }
//output "iam-instance-profile-id" { value = aws_iam_instance_profile.this.id }
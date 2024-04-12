
output "vpc" { value = module.vpc }
output "public-subnets" { value = module.public-subnets }
output "cw-profile" { value = module.cw-profile }
output "ec2" { value = module.instances }
output "cw-alarm" { value = module.cw-alarm }


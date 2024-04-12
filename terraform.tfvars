vpc-name          = "custom"
vpc-cidr          = "10.0.0.0/20"
ig-name           = "custom"
public-sg-name    = "public-sg"
private-sg-name   = "private-sg"
public-rt-name    = "public-rt"
private-rt-name   = "private-rt"
default-nacl-name = "public-nacl"
private-nacl-name = "private-nacl"
anywhere-cidr     = "0.0.0.0/0"
public-cidr       = "10.0.0.0/24"
private-cidr      = "10.0.1.0/24"


public-name = "public-subnet"
public-subnets = {
  subnet1 = {
    name = "public1"
    cidr = "10.0.0.0/24"
    az   = "eu-west-2a"
  },
  subnet2 = {
    name = "public2"
    cidr = "10.0.1.0/24"
    az   = "eu-west-2b"
  }
  
}


instance-type = "t2.micro"
key-name      = "keypair1"


ec2-instance = {
  Windows = {
    ami      = "ami-0f00a31129b3158a1"
    name     = "windows"
    filepath = "./modules/infra/ec2/data-windows.sh"
  }
  Redhat = {
    ami      = "ami-035cecbff25e0d91e"
    name     = "Redhat"
    filepath = "./modules/infra/ec2/data-redhat.sh"
  }
  Ubuntu = {
    ami      = "ami-0b9932f4918a00c4f"
    name     = "ubuntu"
    filepath = "./modules/infra/ec2/data-ubuntu.sh"
  }
  Amazon = {
    ami      = "ami-0c618421e207909d0"
    name     = "Amazon"
    filepath = "./modules/infra/ec2/data-amazon.sh"
  }
}
image = "Redhat"



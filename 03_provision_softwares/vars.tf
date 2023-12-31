variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {

  default = "ap-south-1"
}

variable "SECURITY_GROUPS" {
  type = list

  default = ["cosmo-SG"]
}
variable "AMIS" {
  type = map(any)
  default = {
    ap-south-1     = "ami-02a2af70a66af6dfb"
    ap-southeast-1 = "ami-02453f5468b897e31"
    ap-southeast-2 = "ami-0361bbf2b99f46c1d"
  }
}

variable "PATH_TO_PRIVATE_KEY" {
  default = "provision_key"
}

variable "PATH_TO_PUBLIC_KEY" {
  default = "provision_key.pub"
}
variable "INSTANCE_USERNAME" {
  default = "cosmo"
}

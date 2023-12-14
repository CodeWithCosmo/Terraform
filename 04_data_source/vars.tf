variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "AWS_REGION" {

  default = "ap-south-1"
}

variable "SECURITY_GROUPS" {
  type = list # if error replace list with list(string)

  default = ["cosmo-SG"]
}

# To get ami at runtime
# variable "AMIS"{
#   type=map
#   default = {
#     ap-south-1 = "ami-02a2af70a66af6dfb"
#     ap-southeast-1 = "ami-02453f5468b897e31"
#     ap-southeast-2 = "ami-0361bbf2b99f46c1d"
#   }
# } 
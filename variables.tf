variable "ami" {
  type = string
  default = "ami-0855d04c4bc4eb106"
}

variable "instance_type" {
  type = string
  default = "t2.micro"
}

variable "Env" {
  default = "dev"
}

variable "instance-Name" {
  default = "postgresql-server"
}

variable "Name" {
  default = "terraform vpc"
}
variable "cidr_block" {
  default = "18.0.0.0/20"
}
variable "availability_zone" {
  default = "ca-central-1a"
}
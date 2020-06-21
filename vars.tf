variable "ACCESS_KEY" {
  default = "<ACCESS_KEY>" //Personal Account
}

variable "SECRET_KEY" {
  default = "<SECRET_KEY>" //Personal Account
}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AVL_ZONE_A" {
  default = "us-east-1a"
}

variable "AVL_ZONE_B" {
  default = "us-east-1b"
}

variable "PRIVATE_KEY_PATH" {
  default = "london-region-key-pair"
}

variable "PUBLIC_KEY_PATH" {
  default = "london-region-key-pair.pub"
}

variable "EC2_USER" {
  default = "ubuntu"
}

#DB related

variable "db_instance" {
  default = "db.t2.micro"
}

variable "db_option_group" {
  default = ""
}

variable "db_parameter_group" {
  default = ""
}
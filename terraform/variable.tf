variable "ami-ubuntu" {
  type        = string
  default     = "ami-0b6d9d3d33ba97d99"
  
}

variable "free-tier-instance" {
  type        = string
  default     = "t3.micro"
  
}

variable "key-pair" {
  type        = string
  default     = "devops-key"
  
}

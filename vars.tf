variable "default_tags" {
    type = map(string)
    default = {
        "env" = "awinter"
}
description = "description for my variable"
}
variable "public_subnet_count"{
    type = number
    description = "number of public subnets"
    default = 2
}
variable "vpc_cidr"{
    type = string
    default = "10.0.0.0/16"
    description = "cidr for vpc"
}
variable "private_subnet_count" {
  type        = number
  description = "private subnet count"
  default     = 2
}
variable "sg_db_ingress"{
    type = map(object({
        from_port = number
        protocol = string
        self = bool
    }))
    default = {
        "poastresql" = {
            from_port = 5432
            protocol = "tcp"
            self = true
        }
    }
}
variable "sg_db_egress"{
    type = map(object({
        from_port = number
        protocol = string
        self = bool
    }))
    default = {
        "all" = {
            from_port = 0
            protocol = "-1"
            self = true
        }
    }
}
    variable "db_credentials" {
        type = map(any)
        sensitive = true
        default = {
            username = "goodusername"
            password = "goodpassword"
        }
    }
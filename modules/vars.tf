variable "sg_name" {
  type        = string

}
variable "description" {
  type        = string

}
variable "vpc_id" {
    type        = string

}
variable "sg_db_ingress"{
    type = map(object({
        from_port = number
        protocol = string
        self = bool
    }))
    description = "map of ingress rules"
}
variable "sg_db_egress"{
    type = map(object({
        from_port = number
        protocol = string
        self = bool
    }))
    description = "map of egress rules"
}
variable "sg_source" {
  type        = list(string)
    description = "list of source security groups"
}
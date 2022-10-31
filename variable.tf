variable "AWS_REGION" {    
   default = "ap-south-1"
}
variable "address_space" {
    default = "10.100.0.0/24"
}
variable "public_subnet_01" {
    default = "10.100.0.0/26"
} 
variable "public_subnet_02" {
    default = "10.100.0.64/26"
}
variable "private_subnet_01" {
    default = "10.100.0.128/26"
}
 variable "private_subnet_02" {
    default = "10.100.0.192/27"
} 
variable "db_subnet" {
    default = "10.100.0.224/27"
}


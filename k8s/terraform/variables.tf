variable "project" {
  default = "opaexample"
}

variable "region" {
  default = "europe-west1"
}

variable "zone" {
  default = "europe-west1-b"
}

variable "additional_zones" {
  type = "list"

  default = [
    "europe-west1-c",
    "europe-west1-d",
  ]
}

variable "prefix" {
  default = "opa"
}

variable "machine_type" {
  default = "n1-standard-1"
}

variable "primary_ip_range" {
  default = "10.3.0.0/20"
}
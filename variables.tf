variable "instance_count"{
    default = 3
}

variable "instance_tags" {
    type = list(string)
    default = ["vs-control", "vs-test", "vs-worker-and-backup-server"]
}

variable "instance_ami" {
    default = "ami-0d5bf08bc8017c83b"
}

variable "key_name" {
    default = "vs-dev-ohio-kp"
}
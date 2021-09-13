variable "aws_region" {
  default     = "us-west-2"
  description = "aws region where our resources going to create choose"
  #replace the region as suits for your requirement
}

variable "az_count" {
  default     = "1"
  description = "number of availability zones in above region"
}

variable "app_count" {
  default     = "1" 
  description = "numer of docker containers to run"
}


variable "ecs_task_execution_role" {
  default     = "myECcsTaskExecutionRole"
  description = "ECS task execution role name"
}

variable "app_image" {
  default     = "registry.hub.docker.com/radiantone/fid:7.3.16"
  description = "docker image to run in this ECS cluster"
}

variable "license" {
    default  = "{rlib}x9TJ257h2YzhyM3Ms8/Y1dDV3a+dytjQftHW2MXj18Cs2ZrWy8/H3NfR53jj4NnIj8fZ1c2a2cTf0NvExsrT156eqXugnZiVgpKYlcrSsXywl6uTlZORopGepHmfl5qXf5aVrpabt3+yqZ2TgpGUmZGhug=="
}

variable "app_port" {
  default     = "7070"
  description = "portexposed on the docker image"
}
variable "admin_port" {
  default     = "8089"
  description = "portexposed on the docker image"
}
variable "ldap_port" {
  default     = "2389"
  description = "portexposed on the docker image"
}
variable "ldaps_port" {
  default     = "2636"
  description = "portexposed on the docker image"
}
variable "zk_port" {
  default     = "2181"
  description = "portexposed on the docker image"
}
variable "zk_enemble" {
  default     = "2888"
  description = "portexposed on the docker image"
}
variable "zk_ensemble_two" {
  default     = "3888"
  description = "portexposed on the docker image"
}


variable "health_check_path" {
  default = "/"
}

variable "fargate_cpu" {
  default     = "1024"
  description = "fargate instacne CPU units to provision,my requirent 1 vcpu so gave 1024"
}

variable "fargate_memory" {
  default     = "2048"
  description = "Fargate instance memory to provision (in MiB) not MB"
}

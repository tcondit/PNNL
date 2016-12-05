# main.tf
#
# A minimal Terraform configuration needs a provider and one resource. For AWS
# it also needs a secret key and access key, and variables: secret key, access
# key, AMI ID, path to private key. Those are stored in variables.tf, but could
# be here. 

provider "aws" {
    region     = "${var.region}"
    access_key = "${var.access_key}"
    secret_key = "${var.secret_key}"
}

resource "aws_instance" "jenkins_master" {
    count          = 1
    ami            = "${lookup(var.amis, var.region)}"
    instance_type  = "t2.micro"
    key_name       = "${var.key_name}"
}

resource "aws_instance" "build_server" {
    count          = 1
    ami            = "${lookup(var.amis, var.region)}"
    instance_type  = "t2.micro"
    key_name       = "${var.key_name}"

#    provisioner "ansible" {
#        connection {
#            user = "ubuntu"
#        }
#
#        playbook = "ansible/playbook.yml"
#        groups = [ "all" ]
#        hosts = [ "terraform" ]
#        extra_vars = {
#            "env" = "terraform"  
#        }
#    }
}


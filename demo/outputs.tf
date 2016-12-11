output "jenkins_master_ip" {
    value = "${aws_instance.jenkins_master.public_ip}"
}

output "build_server_ip" {
    value = "${aws_instance.build_server.public_ip}"
}

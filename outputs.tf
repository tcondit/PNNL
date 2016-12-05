output "ip" {
    value = "${aws_instance.jenkins_master.public_ip}"
    value = "${aws_instance.build_server.public_ip}"
}

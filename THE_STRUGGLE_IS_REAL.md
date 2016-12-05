# The struggle is real

## Moving some values into /private/etc/ansible/hosts


9801a79ddf0d:stacks izz731$ cat /private/etc/ansible/hosts
[all]
54.152.178.97
54.173.183.50

[all:vars]
ansible_user=ubuntu
ansible_ssh_private_key_file=/Users/izz731/Projects/terraform/keys/hashicorp_2016_11.pem



9801a79ddf0d:stacks izz731$ ansible all -m apt -b -a 'pkg=python state=installed update_cache=true'
<green>
54.173.183.50 | SUCCESS => {
    "cache_update_time": 1480953266,
    "cache_updated": true,
    "changed": true
}
54.152.178.97 | SUCCESS => {
    "cache_update_time": 1480953266,
    "cache_updated": true,
    "changed": true
}
</green>


## Error using an ad hoc Ansible command, followed by resolution / 2

* Note the '-b' in here for `become`. Without that I got a wall of angry red text.

9801a79ddf0d:stacks izz731$ ansible all -m apt -b -a 'pkg=python state=installed update_cache=true' --user=ubuntu --key-file=~/Projects/terraform/keys/hashicorp_2016_11.pem
<gold>
54.173.183.50 | SUCCESS => {
    "cache_update_time": 1480921768,
    "cache_updated": true,
    "changed": true
}
54.152.178.97 | SUCCESS => {
    "cache_update_time": 1480921768,
    "cache_updated": true,
    "changed": true
}
</gold>


## Error using an ad hoc Ansible command, followed by resolution / 1

* First errors were from not using an SSH key and for not specifying the SSH
  user name.
* Second time around, the error was that Python (v2) wasn't installed on the hosts.
* This shows me in the middle of resolving both issues.


Here's my /private/etc/ansible/hosts file:

==BEGIN==
9801a79ddf0d:jenkins-docker-ansible izz731$ cat /private/etc/ansible/hosts
[all]

54.152.178.97
54.173.183.50
==END==



9801a79ddf0d:jenkins-docker-ansible izz731$ ansible all -m ping --user=ubuntu --key-file=~/Projects/terraform/keys/hashicorp_2016_11.pem
<red>
54.173.183.50 | FAILED! => {
    "changed": false,
    "failed": true,
    "module_stderr": "Shared connection to 54.173.183.50 closed.\r\n",
    "module_stdout": "/bin/sh: 1: /usr/bin/python: not found\r\n",
    "msg": "MODULE FAILURE"
}
</red>
<green>
54.152.178.97 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
</green>



9801a79ddf0d:jenkins-docker-ansible izz731$ ssh -i ~/Projects/terraform/keys/hashicorp_2016_11.pem ubuntu@54.173.183.50
Welcome to Ubuntu 16.04.1 LTS (GNU/Linux 4.4.0-47-generic x86_64)

 * Documentation:  https://help.ubuntu.com
 * Management:     https://landscape.canonical.com
 * Support:        https://ubuntu.com/advantage

  Get cloud support with Ubuntu Advantage Cloud Guest:
    http://www.ubuntu.com/business/services/cloud

0 packages can be updated.
0 updates are security updates.


Last login: Mon Dec  5 06:58:02 2016 from 50.35.86.52
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

ubuntu@ip-172-31-61-218:~$ sudo apt-get install python
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following additional packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python-minimal python2.7
  python2.7-minimal
Suggested packages:
  python-doc python-tk python2.7-doc binutils binfmt-support
The following NEW packages will be installed:
  libpython-stdlib libpython2.7-minimal libpython2.7-stdlib python python-minimal python2.7
  python2.7-minimal
0 upgraded, 7 newly installed, 0 to remove and 0 not upgraded.
Need to get 3,915 kB of archives.
After this operation, 16.6 MB of additional disk space will be used.
Do you want to continue? [Y/n]
Get:1 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-minimal amd64 2.7.12-1ubuntu0~16.04.1 [339 kB]
Get:2 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7-minimal amd64 2.7.12-1ubuntu0~16.04.1 [1,295 kB]
Get:3 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial/main amd64 python-minimal amd64 2.7.11-1 [28.2 kB]
Get:4 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial-updates/main amd64 libpython2.7-stdlib amd64 2.7.12-1ubuntu0~16.04.1 [1,884 kB]
Get:5 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial-updates/main amd64 python2.7 amd64 2.7.12-1ubuntu0~16.04.1 [224 kB]
Get:6 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial/main amd64 libpython-stdlib amd64 2.7.11-1 [7,656 B]
Get:7 http://us-east-1.ec2.archive.ubuntu.com/ubuntu xenial/main amd64 python amd64 2.7.11-1 [137 kB]
Fetched 3,915 kB in 0s (48.6 MB/s)
Selecting previously unselected package libpython2.7-minimal:amd64.
(Reading database ... 53678 files and directories currently installed.)
Preparing to unpack .../libpython2.7-minimal_2.7.12-1ubuntu0~16.04.1_amd64.deb ...
Unpacking libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.1) ...
Selecting previously unselected package python2.7-minimal.
Preparing to unpack .../python2.7-minimal_2.7.12-1ubuntu0~16.04.1_amd64.deb ...
Unpacking python2.7-minimal (2.7.12-1ubuntu0~16.04.1) ...
Selecting previously unselected package python-minimal.
Preparing to unpack .../python-minimal_2.7.11-1_amd64.deb ...
Unpacking python-minimal (2.7.11-1) ...
Selecting previously unselected package libpython2.7-stdlib:amd64.
Preparing to unpack .../libpython2.7-stdlib_2.7.12-1ubuntu0~16.04.1_amd64.deb ...
Unpacking libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.1) ...
Selecting previously unselected package python2.7.
Preparing to unpack .../python2.7_2.7.12-1ubuntu0~16.04.1_amd64.deb ...
Unpacking python2.7 (2.7.12-1ubuntu0~16.04.1) ...
Selecting previously unselected package libpython-stdlib:amd64.
Preparing to unpack .../libpython-stdlib_2.7.11-1_amd64.deb ...
Unpacking libpython-stdlib:amd64 (2.7.11-1) ...
Processing triggers for man-db (2.7.5-1) ...
Processing triggers for mime-support (3.59ubuntu1) ...
Setting up libpython2.7-minimal:amd64 (2.7.12-1ubuntu0~16.04.1) ...
Setting up python2.7-minimal (2.7.12-1ubuntu0~16.04.1) ...
Linking and byte-compiling packages for runtime python2.7...
Setting up python-minimal (2.7.11-1) ...
Selecting previously unselected package python.
(Reading database ... 54424 files and directories currently installed.)
Preparing to unpack .../python_2.7.11-1_amd64.deb ...
Unpacking python (2.7.11-1) ...
Processing triggers for man-db (2.7.5-1) ...
Setting up libpython2.7-stdlib:amd64 (2.7.12-1ubuntu0~16.04.1) ...
Setting up python2.7 (2.7.12-1ubuntu0~16.04.1) ...
Setting up libpython-stdlib:amd64 (2.7.11-1) ...
Setting up python (2.7.11-1) ...
ubuntu@ip-172-31-61-218:~$ exit
logout
Connection to 54.173.183.50 closed.



9801a79ddf0d:jenkins-docker-ansible izz731$ ansible all -m ping --user=ubuntu --key-file=~/Projects/terraform/keys/hashicorp_2016_11.pem
<green>
54.152.178.97 | SUCCESS => {
    "changed": false,
    "ping": "pong"
}
54.173.183.50 | SUCCESS => {
    "changed": false,
    "ping": "pong"
</green>

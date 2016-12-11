# Slides Outline

Slides with slides.com or reveal.js

## Title: Tools for Stack Management

### Intro

* Who am I?
 * Tim Condit, candidate for the Continuous Delivery Engineer role
 * I've been doing builds, (software) configuration management and automation for about 11 years
  * Other stuff before that, including wide area networking, teaching Linux administration and Java
 * AWS Certified Developer - Associate
 * Co-organizer, Seattle Jenkins Area Meetup (JAM)
 * One of the lucky ones


[ !! TODO Swap this out for a quick chat about not flashy, not particularly clever, but useful and a firm foundation upon which to build. ]
 * Talking about stack provisioning and configuration management
  * Foundations for CI/CD


* DevOps
 * DevOps feels like "the next phase" of agile
 * Both rely on external artifacts
  * backlogs, story boards, burn down charts
  * version control, infrastructure as source code
 * Both have established or evolving practices
  * poker planning, commitments, daily stand ups, sprint acceptance meetings
  * code reviews, frequent integrations, automated testing, (potentially) continuous deployment, production support
 * Both bring development teams together with stakeholders
  * product owners
  * operations
 * == OR ==
 * Both formalize the stakeholder roles
  * developers, QA, scrum master, product owner, backlog owner
  * developers, QA, Operations
 * Both rely on fast feedback
 * Really, both are about creating high-functioning, cohesive teams
  * But DevOps (correctly, IMO) encourages a more holistic view of the team


* Text Configuration + Version Control = <3 reviewable release process
 * For varying values of releases
  * stack provisioning (SP)
  * (stack) configuration management (CM)
  * continuous integration (CI)
  * continuous delivery (CD)
 * The tools I'll describe and demo today all share these features


### Terraform

* Terraform (HashiCorp)
 * TODO image (Terraform logo)
 * Allows you to create a stack
 * Creates infrastructure using their DSL (HCL)
 * Multiple providers: AWS, Azure, Vagrant, OpenStack, others
  * Different resources for each provider
  * [providers](https://www.terraform.io/docs/providers/index.html)
  * I've heard you can even combine resources from multiple providers (haven't tried it)
 * Preview changes before applying
 * Dynamic data collection
  * TODO screenshot of plan
 * Reproducible infrastructure with states files
 * Option to run a provisioner during creation


* The big deal about Terraform
 * I mentioned some features earlier
  * (create stacks; multiple providers; preview changes; reproducible)
 * Features translate to benefits
  * Efficiency, reuse
   * Share your infrastructure as code
   * Federate your servers if you want
  * Visibility
   * `terraform plan` will show you what it's going to do
  * Safety (confidence)
   * `terraform plan` will tell you if things have changed
   * `terraform apply` will reset your configuration to a known state


* Terraform data/config types [docs](https://www.terraform.io/docs/index.html)
 * providers
  * Responsible for managing the lifecycle of a resource: create, read, update, delete.
  `provider "aws" {
     region     = "${var.region}"
     access_key = "${var.access_key}"
     secret_key = "${var.secret_key}"
  }`
 * resources
  * A component of your infrastructure. It might be some low level component such as a physical server, virtual machine, or container. Or it can be a higher level component such as an email provider, DNS record, or database provider.
  `resource "aws_instance" "jenkins_master" {
     count         = 1
     ami           = "${lookup(var.amis, var.region)}"
     instance_type = "t2.micro"
     key_name      = "${var.key_name}"
  }`
 * variables
  * May include defaults, but not required; may be overridden (last one wins: default -> .tfvars -> CLI)
  `variable "access_key" {}`
  `variable "region" {
     default = "us-east-1"
   }`
 * outputs
  * Write specific data to stdout and stash for later retrieval
  * `terraform output [parameter]`
  * `terraform show`


* Writing Terraform configuration
 * main.tf
 * variables.tf
 * outputs.tf
 * terraform.tfvars
 * (save these to version control)


* Talk thru
 * (four files, four slides)
 * configuration intentionally kept very simple, while still demonstrating the tools' benefits
  * both tools allow you to do a lot with a little
 * blur out my secret key and access key values


* Stack Description
 * Base stack, minimal security and resilience
   * a private network (virtual public cloud)
   * virtual machines (EC2 instances)
   * publicly routable IP address (elastic IP)
    * if needed, instances may have public IP addresses
   * firewall rules (security groups)
   * subnets
   * routes
   * default gateway (internet gateway)
 * Between a default VPC and Terraform, we'll get most of this "for free"


* DEMO - Create a simple stack
 * Create a stack pair
 * Show, copy the tfstack file
  * Better still, create a git repo, add it NOW (need it in a minute)
  * No .gitignore
 * Update the config to create 10 build machines, run again
  * Super easy to ramp up, in a manageable way
  * git diff tfstate file

* Main reason I'd recommend against storing these files in version control:
 * Resources are dynamic, states files are static


DEMO 1 STEPS

1. Show empty AWS instances
1. `cd ~/pnnl-talk/demo`
1. Show, mention four files + terraform.tfstate
 1. Yes, it's checked in :)
1. `terraform plan`
1. `terraform apply`
1. `terraform show`
 1. Pulls data from tfstate file
1. `git status`, `git diff` # show state files
 1. Not going to check in the change
 1. Should see the value of "serial"
1. Add tags or names to one or both.
1. `terraform plan`
 1. Should see plan to remove the names.
1. `terraform destroy`
1. `git status`, `git diff` # show state files
 1. Should see only "serial" incremented (twice: once on apply, once on destroy)

Bump it up (dry run)

1. `aws_instance.build_server.count=100` (main.tf)
1. `terraform plan`
1. `aws_instance.build_server.count=1`

Back to AWS console, need two instances running for later.

1. `terraform apply`
1. `terraform output` # we'll need this later



### Ansible

* Ansible (RedHat)
 * TODO image (Ansible logo)
 * Gets a new stack ready for use
 * Configuration mostly YAML
 * Python. The "control machine" runs on several flavors of Linux, Mac, etc.
 * The managed nodes can also run on Windows
  * [platforms](http://docs.ansible.com/ansible/intro_installation.html#control-machine-requirements)
 * Community code called roles available from [Ansible Galaxy](https://galaxy.ansible.com/)

* Ansible data/config types [docs](http://docs.ansible.com/ansible/index.html)
 * playbooks
  * At it's core, Ansible is really an execution engine. The docs say "playbooks can declare configurations, but they can also orchestrate steps of any manual ordered process".
  * We'll see an example in a minute.
 * roles
  *
 * modules
  * Control system resources, like services, packages, or files (anything really), or handle executing system commands. Typically these are called from within playbooks, but they can also be run at the command line.
  * Examples are `ping`, `apt`, `pip`, `git`, etc.

* The inventory file
 *

* Similar to Terraform (some shared philosophy), it also manages configurations to a known state
 * We use Chef for configuration management and deployments at Capital One Investing. This has always bothered me, because Chef's prime directive, as far as I can tell is to *prevent change*. Now we're forcing it to *effect change*. Convergence versus divergence. Wrong tool for the job.
 * Ansible, as an execution engine, is designed to do both. Using Ansible for deployments, it "feels like" driving a state machine. Okay, this is my current state. I'll maintain it *here*. Okay, this is my new state. Now I'll maintain it *here*.
 * If a run partially completes, and fails for some reason, you can re-run it after making some changes and it'll check that parts that are already complete, and not redo them.
 * Caveat: The reporting is not always super accurate. It'll sometimes say it's changing something when really it's just checking it (as far as I can tell).
 * Caveat: Individual tasks may be idempotent, but the whole playbook is not, IMO. It could leave your system in an incomplete state.

* PICK UP HERE
 * show Jenkins running
 * ad hoc command to stop the service on jenkins_master
  * show it's stopped
  * restart it
  * explain that the control machine acts as an administrative proxy, helping us get closer to immutable infrastructure
   * link to 12 factor app?
 * anyone see a problem with this configuration? Hint, it's a logical issue, not syntax
  * starting two masters, no slaves
 * simple things should be easy!
  * simpler to distribute to the teams
  * certainly easier to reason about from a functional point of view, as long as you understand the behavior of the roles you use
  * what constitutes a simple thing keeps getting more complex (which is a good thing)
  *

* Commands
 * ansible
 * ansible-playbook
 * ansible-galaxy

* Roles
 * Stored at /etc/ansible/roles
 * Fetch from Galaxy with `ansible-galaxy`

 * Ad hoc command example
  * `ansible all -m ping`
  * With and without /etc/ansible/hosts
  * Uses the pubic IPs from Terraform

DEMO 2 STEPS

* TODO

* Bare minimum playbook
 * Thanks to reusable roles, it's almost nothing, just a playbook and a requirements file
 * Show files

`ansible-galaxy install -r requirements.yml`
`ansible -m <module> ...`

*


DEMO 3 STEPS

* Show error when trying to install without roles present
 * Poor syntax error, just have to know what it's telling you
 * (I may dig into the code, and poke around, maybe submit a PR)
* Show how to install the requirements
 *

* What's the actual resolution with the SSH problem I ran into? It seemed to go away after SSH'ing to one of the boxes (weird).

* What to do about gather_facts? Maybe I can move it (=no) into a pre-task and add it a second time (=yes) in a post-task.


### Some things not covered here

* There's lots more to learn and share

* Terraform
 * Terraform's graphing function
 * Using with Vagrant or other providers
 * Using modules (and def. not creating modules)
 * Details about the HashiCorp Configuration Language (HCL)

* Ansible
 * The playbook debugger
 * Using the Vault
 * Ansible Tower (of which I know almost nothing)
 * Writing and publishing a role

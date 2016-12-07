# Slides Outline

Slides with slides.com or reveal.js

## Title: Tools for Stack Management

### Intro

* Who am I?
 * Tim Condit, candidate for the Continuous Delivery Engineer role
 * I've been doing builds, (software) configuration management and automation for about 11 years
 * AWS Certified Developer - Associate
 * Co-organizer, Seattle Jenkins Area Meetup (JAM)
 * One of the lucky ones
 * Talking about server provisioning and configuration management
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
 * Allows you to create a stack (like the example given above)
 * Creates infrastructure using their DSL (HCL)
 * Multiple providers: AWS, Azure, Vagrant, OpenStack, others
  * [providers](https://www.terraform.io/docs/providers/index.html)
  * I've heard you can even combine resources from multiple providers (haven't tried it)
 * Preview changes before applying
 * Dynamic data collection
  * TODO screenshot of plan
 * Reproducible infrastructure with states files


* Stack Description
 * Here's a base stack with minimal security, and no failover/HA (AWS names)
   * a private network (virtual public cloud)
   * virtual machines (EC2 instances)
   * publicly routeable IP address (elastic IP)
    * if needed, instances may have public IP addresses
   * firewall rules (security groups)
   * subnets
   * routes
   * default gateway (internet gateway)
 * Between a default VPC and Terraform, we'll get most of this "for free"


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
   * TODO show example of creating stack, changing manually, then running plan/apply to scan/reset
   * `terraform apply` will reset your configuration to a known state


* Writing Terraform configuration
 * main.tf
 * variables.tf
 * outputs.tf
 * terraform.tfvars
 * (save these to version control)


* Talk thru
 * (four files, four slides)
 * blur out my secret key and access key values


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
1. `tf plan`
1. `tf apply`
1. `tf show`
 1. Pulls data from tfstate file
1. `git status`, `git diff` # show state files
 1. Not going to check in the change
 1. Should see the value of "serial"
1. Add tags or names to one or both.
1. `tf plan`
 1. Should see plan to remove the names.
1. `tf destroy`
1. `git status`, `git diff` # show state files
 1. Should see only "serial" incremented (twice: once on apply, once on destroy)

Bump it up (dry run)

1. `aws_instance.build_server.count=100` (main.tf)
1. `tf plan`
1. `aws_instance.build_server.count=1`

Back to AWS console, need two instances running for later.

1. `tf apply`
1. `tf output` # we'll need this later



### Ansible

* Ansible (RedHat)
 * TODO image (Ansible logo)
 * Allows you to get a new stack ready for use
 * Infrastructure configuration mostly YAML
 * The "control machine" runs on several flavors of Linux, Mac, etc.
 * The managed nodes can also run on Windows
  * [platforms](http://docs.ansible.com/ansible/intro_installation.html#control-machine-requirements)

 * Preview changes before applying
 * Dynamic data collection
  * TODO screenshot of plan
 * Reproducible infrastructure with states files


# Slides Outline

Slides with slides.com or reveal.js

## Title: Tools for Stack Management

## Intro

* Who am I?
 * Tim Condit, candidate for the Continuous Delivery Engineer role
 * I've been doing builds, (software) configuration management and automation for about 11 years
 * AWS Certified Developer - Associate
 * Co-organizer, Seattle Jenkins Area Meetup (JAM)
 * One of the lucky ones


[? ditch this ? Seems off-topic ]
* Agile
 * Agile is about shipping the right features at the right time
  * Among other things, that depends on
   * active prioritization
   * timely and accurate communication
   * identifying and resolving roadblocks


[? ditch this ? Seems off-topic ]
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


* Text Configuration + Version Control = <3 reviewable release process
 * For varying values of releases
  * stack provisioning (SP)
  * (stack) configuration management (CM)
  * continuous integration (CI)
  * continuous delivery (CD)
 * The tools I'll describe and demo today all share these features


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
 * Here's a reasonable base stack with minimal security (AWS naming conventions)
   * a private network (virtual public cloud)
   * virtual machines (EC2 instances)
   * publicly routeable IP address (elastic IP)
    * if needed, may have a public IP address
   * firewall rules (security groups)
   * subnets
   * routes
   * default gateway (internet gateway)
 * I'm not going to stand up all of this today (what a cop out!)
 * TODO image (HashiConf?)


* The big deal about Terraform
 * I mentioned some features earlier
  * (create stacks; multiple providers; preview changes; reproducible)
 * Those translate into benefits:
  * Efficiency, reuse
   * Share your infrastructure as code
   * Federate your servers if you want
  * Visibility
   * `terraform plan` will show you what it's going to do
  * Safety (confidence)
   * `terraform plan` will tell you if things have changed
   * TODO show example of creating stack, changing manually, then running plan/apply to scan/reset


* Writing Terraform configuration
 * main.tf
 * variables.tf
 * outputs.tf
 * (save these to version control)


* DEMO
 * Walk thru code


* Generated states files
 * Terraform's source of record
 * Saves the state of your provisioned stack
 * Manages drift
 * Destroy stacks
 * Dynamically updated as your stack is evolved
 * (save these to durable storage somewhere)


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

* DEMO - 

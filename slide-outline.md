# Slides Outline

Slides with slides.com or reveal.js

## Title: Tools for Stack Management

## Intro

* Who am I?
 * Tim Condit, candidate for the Continuous Delivery Engineer role
 * I've been doing builds, (software) configuration management and automation for about 11 years
 * Co-organizer, Seattle Jenkins Area Meetup (JAM)
 * AWS Certified Developer - Associate
 * One of the lucky ones


* Agile and DevOps
 * Agile is ultimately about relevant communication, or "getting to the ground truth"
  * What's that mean? I'm 

 * DevOps sort of feels like "the next phase" of Agile
 * What else is 
 * Sofware configuration management (particularly along with pull requests and code reviews!) is 
 [IMG]
 * One of the Continuous integration is absolutely 
 * CD is certainly 


  effort and getting to the ground truth, SCM, CI/CD and 


* Text Configuration + Version Control = <3 reviewable release process
 * For varying values of releases
  * stack provisioning (SP)
  * (stack) configuration management (CM)
  * continuous integration (CI)
  * continuous delivery (CD)
 * The tools I'll describe and demo today all share these features

* <aside>Stack Description
 * Here's a reasonable base stack with minimal security (AWS naming conventions)
   * a private network (virtual public cloud)
   * virtual machines (EC2 instances)
   * publicly routeable IP address (elastic IP)
    * if needed, may have a public IP address
   * firewall rules (security groups)
   * subnets
   * routes
   * default gateway (internet gateway)
 * </aside>
 * I'm not going to stand up all of this today (what a cop out!)
 * TODO image (HashiConf?)


* Terraform (HashiCorp)
 * Allows you to create a stack (like the example given above)
 * Creates infrastructure using their DSL (HCL)
 * Multiple providers: AWS, Azure, Vagrant, others
  * [providers](https://www.terraform.io/docs/providers/index.html)
 * Preview changes before applying
 * Dynamic data collection
  * TODO screenshot of plan
 * Reproducible infrastructure with states files

* The big deal about Terraform
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

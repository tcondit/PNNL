# Gumbo

## Accomplishments and things to talk about

* A2G
* people manager
* Spark401k
* AccuRev
* AnthillPro - library workflows, builder workflows, projects, BSH, etc.
* Recruiting at conferences
 * 2016
  * DevOps Days Seattle
  * DockerCon (Seattle)
  * Code Writer's Workshop (Seattle)
  * Jenkins World (Santa Clara, CA)
* Recruiting video
 * "I'm one of the lucky ones"
* AWS Certified Developer - Associate

This belongs in the tell me about yourself section.

* Distelli
 * Over the course of about 6 months, worked to get the vendor in-house
 * Long process:
  * Socializing the application among developers
  * Doing multiple demos and taking feature requests
  * Working with the vendor (who became friends of mine) to prioritize new features
   * We worked thru a number of issues with them as they hustled like crazy to add on-prem features to their SaaS solution. They're great to work with, really sharp guys.
   * Working with Disney Imagineering (their other large prospect/customer at the time) to ensure we were in sync
  * Socializing the application among senior leadership, up to and including the CTO of Capital One
   * That's where things started to go off the rails
 * DeploymentPipelinePOC
  * Starting with 18 vendors and/or open source projects, narrowed it down to two: XebiaLabs (XLRelease, XLDeploy) and Distelli
   * Distelli won with the developers, operations
    * I sent out surveys, had the team come in to pitch to our release management team, etc.
    * Release management wanted XLRelease. They felt their voices were not heard, so I spent some time explaining why we reached the decision we did. It was my view that we were taking input from the teams, but as owners, we'd be the majority shareholders.
 * Erik and his manager both signed off on it.
 * But like I said, the demo to the CTO (Rob Alexander) was where things started to go downhill.
 * We had a dev/QA environment up in AWS, and were in the middle of standing up the prod environment when we were told to cancel the project and remove the ASV.
 * My manager and I went to their offices to tell them in person. It was a disappointment, but Rahul was a professional. We're still friends. I stop by to see them about once a month.


## Questions for tech Skype screen

My questions could be thought of as exploring the "state of the state" as PNNL.

1. [ ] Do you do agile?

1. [ ] Server mix? Linux & Windows?

1. [ ] Cloud compute? AWS? Azure? Mixed environment with VMWare?

1. [ ] What do you use for version control?
 * If more than one tool, say Git and SVN, how has that worked out?

[x] 1. If you have a sense for it, how would people react to someone forking their repo and contributing changes?

1. [ ] Do you use an artifact repository?

1. [ ] How variable are the development practices on different teams?
 * [ ] The motivation for the question is around gauging the level of effort (assuming the developers are open to change) to evolve to some consistency around tooling and branching and merging strategies, for example.

1. [ ] Do you create and use VM images (VMDKs, AMIs, etc.)? If so, what are your experiences with "baking in" software, if you're doing that? If you're not doing that, are you using automation to provision new servers?

1. [ ] Reading thru the DOE contract with Battelle (568 pages, wow), I'm wondering about two things.
 * [ ] Do you guys come into contact with **DOE Project Management Procedures** very often? I think there's some good to be gained from project management, and would be interested to learn more about their take on it.
 * [ ] I noticed the "fee base" for FY'16 is $892M, and then drops to around $810M for FY'17 thru FY'22. Is that related to operating budget? I've never heard of a fee base before, but if it's related to operating budget, a ~10% reduction sounds painful.

1. [ ] Information and Infrastructure - Digital Ants
 * [ ] I've had an interest in swarm computing for a long time. Inspired my MS thesis.

1. [ ] 
1. [ ] 
1. [ ] 
1. [ ] 
1. [ ] 
1. [ ] 


## Tell me about yourself

My least favorite question. Maybe I can make it my favorite question.

### Things I think are worth talking about

* Service oriented: love to help out, love to get people unblocked. But will
  encourage people to try and answer their own questions first, before bringing
  them to me. I've been in, and am in fact just leaving an environment where we
  were a little to quick to solve simpler issues for people, which created an
  unhealthy (IMO) dependency relationship.

* Always learning: currently learning Terraform for server stack creation.
  After I've got a comfortable handle on that, I'll move on to server
  provisioning with Ansible. *[Good time to mention my API-based password
  manager idea?]*

* Not a tooling fetishist: I prefer some things over others (and don't care for
  some popular tools), but will use what works, depending on the situation. I
  love command line tools where appropriate. For example, I don't use Git GUIs,
  but love the visual display of GitHub for doing code reviews and pull
  requests.

* Loyal: I don't have much interest in moving around very often. It's so much
  nicer (IMO) to be established somewhere, and know how to get things done.

* Connector: I love to put people together. The flip side of that is, I don't
  want to be anyone's bottleneck. Sometimes people think it's good to be the
  conduit thru which everything flows, but ...

* Tend toward introversion, but with a strong desire to understand people on a
  deeper than superficial level. I'm super interested in what makes people
  tick. So for example, while I'd love to sit down with each of you and get to
  know you, if I was invited to a party, I'd have to force myself to go.

### Boring work history stuff

* Leading a team of CI/CD and environments engineers

* Tools included 
 * AWS (CloudFormation, EC2, ELB, S3, VPC, routing, security groups, etc.)
 * Jenkins (OCD, Dev, SharedServices)
  * Servers provisioned for OCD and for developers and operations
 * Artifactory (OCD, Dev, SharedServices)
 * Chef
 * Git / GitHub

### Also be sure to mention

* Just got AWS Developer Associate certification

* Going to re:Invent next week

* All servers required to be rehydrated every 60 days (what a pain), which
  forced us to write automation.

* Seattle JAM co-organizer

* CapitalOne Coders school lead and lead instructor


## An unordered list of things to do and learn in the DevOps space

This should be a spreadsheet

### Technology (regardless of brand)

* Containers
* Secrets management
* Container orchestration
* API development and consumption
* Stack provisioning
* Stack configuration management
* Software configuration management
* Continuous Integration
* Continuous Delivery (&& Continuous Deployment)
* Test automation
 * integration and functional (application) testing
 * infrastructure testing

### Technology (product / sponsor or company)

* Rancher / Rancher
* Kubernetes / Google
* Terraform (continue) / HashiCorp
* Ansible (continue) / RedHat
 * as an IT automation tool / task execution engine, can handle stack CM and deployments
* Docker (unavoidable) / Docker
 * also containers WITHOUT using Docker / unaffiliated
* Chef (continue) / Chef
 * I'm on the fence with this one
 * To some degree, can't dictate the market
 * On the other hand, I don't want to address the whole market
* Secret management (KMS, Vault) / AWS, HashiCorp
* TestInfra, ServerSpec, Kitchen


## Tools I know and love (or something like that)

### Chef

* My view: for server provisioning (configuration management) only!
 * CM is about keeping things from changing, IOW managing configuration drift
 * Using Chef for deployments is exactly the opposite activity. It's a poor fit.

* Worked with the OpsDBAs to get the encrypted data bags into our combined Chef cookbooks + CloudFormation templates for standing up services.

How did we use ... ?

* [ ] roles
* [ ] environments
* [ ] cookbooks


### Jenkins

* v1.x

* v2.x

* 

### Artifactory

* 

### AWS

* CloudFormation

* 


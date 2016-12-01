# Presentation to PNNL [outline]

## Random notes

* It'll be something in the DevOps / CI/CD / bla bla bla space.
* Love this quote. Consider using it.

    "If it hurts, do it more frequently, and bring the pain forward." ― Jez Humble, _Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation_

* Consider using one of these repos. One heavyweight, one lighter.
 *

* Kolbe assessment - primary char(?) is "fact finder". I said that's interesting, I'd like to know more about that. (That's a joke people!)

* Such an amazing time to be working in this field. Even being a late adopter, there's just a huge amount of learning and productivity gains to be made. We're just getting started. The future is bright. (AWS Snowmobile!! LOL!!)

* Who comes to work every day thinking about DevOps/ CI/CD / etc.? It's good stuff, and valuable to think deeply about, but the sooner you're not thinking as much about it, the better in some sense. I'm here to promote the idea that this stuff should be **boring**. Not exciting. Certainly not scary. I'm on a mission to make it more like turning on the lights in your house. Well, maybe not quite that way. I'm not sure. Because the only time I think about the lights at home is when a bulb burns out. (Analogy sucks, LOL.)

* By default, I like to find ways to tie new concepts to things you're already familiar with.

* Ideally, we'll change the nature of your relationship with your compute resources (or networks, or database, or caching, or ...). It (or they) will fade into the background where it belongs (IMO). Instead of talking about a server or stack, qa1 or dev2 or whatever, we can instead talk about functionality. Your application can be deployed to some dynamic (essentially anonymous) stack, where some test automation runs. Then we can talk about ...

* Assumptions are biases

* I try to be aware of my biases, and approach things with improving degrees of objectivity. **TODO more about this**

* Instead of worrying too much about key management for now, it's simpler to just use a given key for a limited purpose, and consider it low-risk and low-value. (See Madetech repo)

* Dev - Default activity is to keep changing things. Add new features, roll out updates, etc.
* Ops - Default activity is to keep things from changing (or at least keep things within some acceptable range, however that's defined). If things change too much, it may be an error condition to triage and resolve.
* So on some level, these actors have opposing goals. That's one place where I find Terraform to be so interesting. It's infrastructure as source code (IaSC), which, if the Operations folks are on board for it, starts to subtly inoculate them to the "developer way". You wind up changing the source to effect changes to the stack. But at the same time, it's explicit about managing out-of-band configuration drift, or changes that are not "part of the plan", in other words. So there's a lot that should be familiar to someone who's default activity is to keep things from changing.

* I wanted to do a talk about Docker and ECS (EC2 container service), but having only started to use EC2 last Thursday, I don't feel qualified. That almost didn't stop me from doing it. What *did* stop me from doing it, though, was the (let's face it) fear that I'd go down one path after another, and not find a "base case" on which I could build a talk that would satisfy me. (Recall me saying I'm a fact finder and like to work from first principles?)

* I saw one of my favorite speakers last week at re:Invent. Adam Jacob, the CTO of Chef, is a guy I really respect, both for what, but also how we communicates about what he calls DevOps kung fu. {{ Something about getting personal, and colorful slides, and really connecting with people. I like the purely technical talks too, but his messages always resonate with me, at least partly because he's just having **so much fun**. }}

## Possible talk titles

* Mistakes I've made
 * long-running SVN branches at Envision - better to merge to master multiple times per day
 * maintaining multiple target environments with separate stacks - better to use the same source everywhere and use configuration or access controls to drive deployments to different VPCs
 * Using CloudFormation - declarative; JSON; single-provider; cannot parameterize - Terraform none of those things
 * Not moving fast enough (although I'm on the fence about this one)


## List of things
* And stuff
 * IoT (Alexa)
 * separation of concerns
 * high availability
 * disaster recovery
 * database management
 * blue-green deployments
 * monitoring
 * logging
 * functional testing
 * integration testing
 * continuous integration
 * continuous delivery (and continuous deployment)
 * server provisioning
 * server configuration management
 * for that matter, software configuration management too
 * documentation
 * infrastructure as source
 * code reviews
 * integrating unit tests into CI/CD
 * Containers! Docker! All the things!
 * service discovery
 * key and secrets management
 * module / assembly (library) / application versioning
 *


 ## Talk topics

 * A recent idea I had was to put together a network in AWS (VPC, IGW, route tables, security groups, subnets, etc.) manually, then show the same thing with Terraform only much quicker. But that'll take too long. James said the killer feature of Terraform is the ability to reset it. Manage configuration drift, in other words. So now I'm trying to think of how to turn that into a talk. Because that would be SO HOT right now. I need a narrative to go with it.

 * Parts to consider including:
  * Terraform to provision stack
  * Ansible to configure stack
  * Application written in Elm
  * Ansible to deploy? To where? I'm back to needing too much stuff for a quick demo.
   * Would be good to figure this piece out though.


## Potential slides

### Welcome and Introduction

* I'm Tim Condit, currently at Capital One, but soon to be moving on. A lot of what I'll be talking about today is stuff I either did there, or wanted to do there. For many good reasons (including security, change management, auditing and reputation), it's a tightly controlled environment.

* Thinking about this presentation, I had several different ideas about what to talk about. For instance, I wanted to write an EC2 (AWS virtual machine) CI/CD pipeline. But that means standing up at least two stacks - one for the build (never mind real continuous integration), the second a deployment target. Beyond that, I'd need what I sometimes call a "slug" or a "baton", which is an application to deploy. But I was out of town, and didn't have a lot of time. That's not an excuse! Limiting resources is a great way of forcing me to focus! Second thing I wanted to do was spin up a container-based build and deployment tool, and show some of the possibilities for the future. But I'm not super familiar with that stuff right now. And really, I've gotta be true to myself, and respectful of your time and attention.

So thank you for coming today. I'll try to make it worth your time, or barring that, at least give you some things to think about.


### Broadening the notion of SDLC

* The software development lifecycle is


### A "new SDLC" - software deployment lifecycle

* This may be slight heresy
* I've also got to mature
* Whereas developers

### A confession [need a new title]
**NO SELF-DEPRECATION. PERIOD.**

* I tend to view applications as black boxes, aside from whatever configuration is needed. I and my team need to focus on creating and maintaining source to create the cattle on which their applications will run.

My experience is that it goes both ways. Developers want to know what to do to deploy to production, but for many, it's a distraction from application development.

Thankfully, this "practices gap" is closing. More services and operations staff are reaching out to developers. And developers, for their part, are learning more about the tools of CI/CD.


### Standardization

* Let's identify our requirements, pilot (spike) some solutions, and then CHOOSE one of them.
* Let's agree to a periodic (annual? semi-annual?) technology review. Are the tools we're using still meeting the needs of the organization?
 * Let's evolve a culture of "socializing"
* Let's reduce "buyer's remorse" by keeping in mind that we'll review our choices, and pivot as needed **based on experience in context**.
 * At the same time, let's agree that if our preferred technology or tool didn't make the cut, that we'll do another review in the future.

* It's all about velocity.
 * 4x lanes v. 1. Some kind of visual here. Don't take it too far, though, because water thru a pipe (for example) is **a lot** less complex than managing the full dev+deployment lifecycle.

* 12-factor app

### Agile

* It's all about communication.
 * product owner <--> (backlog owner, scrum master) // I like to think of a product owner as "customer advocate", but other approaches like eXtreme Programming actually are closer to the customer.
 * backlog owner <--> (scrum master, sprint team)
 * scrum master  <--> sprint team

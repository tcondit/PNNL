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
 * penetration testing / fuzzing
 * scale up / scale out


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


### [need a title]

I didn't know what this talk would be about until last Thursday. Thankfully I was busy morning to night, and didn't have blocks of time to sit down and start writing. With a little distance, the ideas were flooding in.

One thing I knew for sure is that I didn't want to come in and just do some kind of technical demo. I dig technology, but don't fetishize it. It's a means to an end, and the end is what matters.

Beyond that, though, you guys have given me the gift of your time. So I feel it's important to give something back. I'd like to give you some insight into how I'd approach work, to help you decide if we're compatible. After that, for sure we'll do a demo. We live in **amazing times**. Things are accelerating in the DevOps space the past few years. For a lifelong learner, it's so gratifying. So I'll demo some stuff I've been learning over the past couple weeks.


~~The end for me always includes the people. Delivering the bits is a collaborative effort, and delivering a second time is ...~~


### Values (not inclusive)

I like things that are:

* stable
* reliable
* predictable

With respect to software development and deployment, these features are also valuable:

* hands-free
* fast
* flexible: rollback-able (keeping options open)
* flexible: blue-green
 * carve off some fraction of servers for live testing
* visible
 * reporting, monitoring
* trending towards complete (as far as possible)
 * tracking versions, understanding dependencies, it's kind of an open question / issue
* supportable [TODO get rid of the "able's"]
* testable [TODO ditto]
* secure
* functions as designed; delights users
* alarms or notifications have enough info to decide how quickly you need to respond
*


### Broadening the notion of SDLC

* The software development lifecycle is


### A "new SDLC" - software deployment lifecycle

* This may be slight heresy
* I've also got to mature
* Whereas developers

### A confession [need a new title]
**NO SELF-DEPRECATION. PERIOD.**

* [aside] "look at everything we didn't have to build" <-- MapBox CEO at re:Invent during Werner's keynote (so awesome)

* [aside] (paraphrasing) No one gets kudos for using servers; they get kudos for serving users. <-- Twilio CEO at re:Invent during Werner's keynote (not bad, sort of clever I guess (obviously somewhat memorable))

* I tend to view applications as black boxes, aside from whatever configuration is needed. I and my team need to focus on creating and maintaining source to create the cattle on which their applications will run.

My experience is that it goes both ways. Developers want to know what to do to deploy to production, but for many, it's a distraction from application development.

Thankfully, this "practices gap" is closing. More services and operations staff are reaching out to developers. And developers, for their part, are learning more about the tools of CI/CD.


### Standardization

* Let's identify our requirements, pilot (spike) some solutions, and then CHOOSE one of them.

* Let's agree to a periodic (annual? semi-annual?) technology review. Are the tools we're using still meeting the needs of the organization?
 * Let's evolve a culture of "socializing"


* Let's reduce "buyer's remorse" by keeping in mind that we'll review our choices, and pivot as needed **based on experience in context**.
 * At the same time, let's agree that if our preferred technology or tool didn't make the cut, that we'll do another review in the future.


* Let's focus on the second (or third or ...) deployment. That's where you find out if you've got the right abstractions and change management features in place.

* It's all about velocity.
 * 4x lanes v. 1. Some kind of visual here. Don't take it too far, though, because water thru a pipe (for example) is **a lot** less complex than managing the full dev+deployment lifecycle.

* 12-factor app

### Agile

* It's all about communication.
 * product owner <--> (backlog owner, scrum master) // I like to think of a product owner as "customer advocate", but other approaches like eXtreme Programming actually are closer to the customer.
 * backlog owner <--> (scrum master, sprint team)
 * scrum master  <--> sprint team

### [need a title: Community?]

* Let's share.
 * Sharing is caring
 * Everyone loves to have people use their stuff
 * Similar in my mind to the "second deployment" I mentioned earlier. (Huh?) (What I mean by that is) getting our stuff in front of other users will increase its fitness. They'll find issues we don't, based possibly on use cases. They'll make requests that we hadn't thought of. They'll contribute features we don't need and may not prioritize. Win-win! **[TODO rewrite this]**


* Let's demo our work and invite everyone to come and see it
 * For the person who's work is being demoed, you may need courage and humility
 * For those watching the demoes, it's super important to be encouraging
 * If you want to be critical, please keep it on the feature, **not** the presenter.
  * **This takes practice on both sides!** It can feel like a landmine to say it, and it can feel like a personal attack to receive it.


* Let's keep it simple
 * key management and the Madetech approach
 * maybe a dead end, since keys tend to be a means of protecting things. But even cattle need to be protected from predators.


* Let's feel the pain
 * "If it hurts, do it more frequently, and bring the pain forward." ― Jez Humble, _Continuous Delivery: Reliable Software Releases Through Build, Test, and Deployment Automation_


* Let's feel the fear
 * (Jim Gaffigan voice) wow, this got dark quickly
 * but continue anyway
 * put yourself out of a job (at least your current role)
 * if you're good at what you do, and can demonstrate that, you'll be fine


* Know when to zoom in or zoom out
 * What are you working on? Is it a command-line tool for private use? If so, you can probably get away with positional parameters, and no documentation. But if you're planning to share it, you'll probably want named parameters and at least a README or USAGE document.
 * How about if you're processing data? Can you read the whole data set into memory, or do you need to use some kind of generator that iterates over values? Or maybe you need to go further still, and pull data from a queue.
 * In both examples you'll need to think about solutions that match the problem you're trying to solve. But there's another area where I think zooming in or out is more important.
 * But, like so much of this part of my talk, where zooming in or out is more important is with people. Are you writing some application that's going to production at some point? Are you keeping the operations team up to date with what you're working on, and what you'll need from them in order to properly support it? Have you shared your schema with the DBAs? Have you done a 30% demo for the product owner yet?
 * Going further, ~~have you considered how this new piece will interact with existing pieces?~~


* Remember the words of the gentle painter and all around good guy, Bob Ross

### [need a title: Continuous Improvement?]

* There's lots of new stuff to learn and experiment with. It will sometimes make sense to move to a new "thing". But I'd submit that changes should be ... **[TODO something about don't just change stuff because it's the new shiny.]**

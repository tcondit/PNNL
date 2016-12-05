# Demo outline

## Parts is parts

`Terraform` for stack provisioning<br>
`Ansible` for configuration management<br>
`TBD` for deployment<br>


## High level review

### Intro (5 min)

(Do, don't say: going broad, covering a range of topics as opposed to going
deep on one piece.)

1. We talk about CI/CD (TODO: name them, define them). I believe the role I'm
   competing for even has "continuous delivery" in the title. It's a hot area
   right now (for some values of hot).

1. But I'd like to expand on that a bit, and suggest that we should include
   server (or stack) provisioning (SP) and server (or stack) configuration
   management (CM) in there as well. So I sometimes think of CI/CD more broadly
   as SP/CM/CI/CD. Catchy huh? Anyway, that's what I'll be talking about today,
   if I can fit it all in. The basic idea is that we can't integrate or deliver
   anything without the underlying infrastructure. So let's "begin at the
   beginning (or a beginning anyway -  we can always go deeper, but this is a
   reasonable base on which to build)", and start there.

1. <def> stack provisioning (SP): I'd loosely define SP as "the providers,
   source code and configuration needed to create your operations resources".
   This could include virtual machines, databases, networking, firewalls,
   storage, all kinds of stuff. In the interests of time, today it'll mostly be
   virtual machines, either locally with Vagrant (I'll show you) or on Amazon
   Web Services with EC2 (elastic compute cloud).

   We'll use a tool called Terraform from HashiCorp to provision a couple stacks.

1. <def> configuration management (CM): I'll define CM as "the source code and
   automation needed to get a provisioned stack ready for deployment". That's
   maybe not a great definition, because it declares both a dependency (on SP)
   and declares itself as a dependency for CI. Or maybe that's what makes it a
   good definition. It's saying "this is where I belong". 

   We'll use a tool called Ansible, now part of RedHat, to configure our
   stacks. When they're ready, one will be a Jenkins build and deployment
   server, and the other will be a deployment target.

1. <def> continuous integration (CI): The original definition is (TODO
   overhead) "Continuous Integration (CI) is a development practice that
   requires developers to integrate code into a shared repository several times
   a day. Each check-in is then verified by an automated build, allowing teams
   to detect problems early.

   By integrating regularly, you can detect errors quickly, and locate them
   more easily.". [Continuous integration](https://www.thoughtworks.com/continuous-integration<Paste>)

   (TODO soften this) This term seems to have lost its way in some sense. It's
   about source code integration, specifically into a shared repository. But
   it's taken on a second meaning, almost distinct from that, which is to run a
   build on some server somewhere, possibly in a non-integrated fashion. I'll
   not have much to say about the second meaning, beyond describing it and
   suggesting that it's maybe a bit of an anti-pattern.

   Imagine you've got a source code repository somewhere, with a HEAD branch
   for main development, and one or more feature branches nearby. This second
   meaning allows for building the feature branches, which, while there's
   surely value in that, that's not integrated. I may be splitting hairs here,
   but I think a different term would be useful here. Maybe we could revive the
   old Microsoft term, BVT or build verification test.

   (TODO don't get ranty) Back on topic: the reason I'm making the distinction
   between the strict original and somewhat looser second meaning, is that CI
   is all about maintaining a disciplined practice. I view this role, and this
   whole emerging field of DevOps, as a way of making ...

1. <def> continuous delivery (CD): (a tweet) "Continuous Delivery doesn't mean
   every change is deployed to production ASAP. It means every change is proven
   to be deployable at any time."
   [Continuous Delivery vs. Continuous Deployment: What's the diff?](https://puppet.com/blog/continuous-delivery-vs-continuous-deployment-what-s-diff)

   It's all about keeping your options open. You may not deploy every time, but
   you have the confidence (or **courage** as the eXtreme Programming folks
   liked to say), backed by your test and quality automation, that you
   **could** deploy every time if you so choose. But I'd submit the courage is
   a knock-on effect. It comes from having created a safe environment for
   learning and experimentation. Breaking things becomes a lower risk activity,
   hopefully leading to more daring experiments.

   (TODO continue this later)


### Terraform (10 min)

(image)

Here's a reasonable, possibly even conventional design for a two-tier web
application stack. (imagery: close the loop SP -> CM -> CI -> CD -> SP) We live
in a time when this is readily available, on demand, for as long or as short a
time as you need. It's incredible. If the whole talk today were about server
provisioning, we could have this up and running -- and ready to share with
anyone who wants to replicate it -- before the talk was over. It just blows me
away. I remember when Sun Sparc Stations were a big deal. Back in college, we
used DEC Alphas! The world has changed, and it's so much better.

In my opinion, this is the least you need for a base stack with minimal security.

Walk thru parts of a stack
1. VPC
1. EC2 instances
1. elastic IP
1. security groups
1. subnets
1. routes
1. internet gateway

For a bit more, you'll want to add data center or regional replication.

1. multiple AZs
1. multiple regions (maybe)
 1. would have to include VPC peering
1. what else?

### Ansible (10 min)

1. 

### Jenkins (10 min)

1. 

### Put it all together (5 min)

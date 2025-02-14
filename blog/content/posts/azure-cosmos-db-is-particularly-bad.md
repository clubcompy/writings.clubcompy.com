---
title: "Azure Cosmos DB is a particularly bad architectural element"
date: 2024-12-20T21:49:00-07:00
draft: true
author: Woldie
tags: ["cosmos","cosmos-db","NoSQL","architecture","marketecture"]
onhomepage: true
---

{{< sidebar file="../snippets/sales-message.md" >}}

## I know enough to be dangerous

I have this intuition that Azure Cosmos DB is not a great choice for most
enterprise software architectures. I think the database technology itself is
fine and interesting, I think may be making some speed for indexing and search
feature tradeoffs relative to AWS' DynamoDB that is okay.

It's just a spidey sense, but I think the way it is marketed and some of the
design choices of Cosmos make it particularly bad for run-of-the-mill enterprise
apps.

So, I know a few things.  I've been doing NoSQL since the Cassandra 1.0 days and
before DynamoDB had on-demand capacity.  I think I know where the NoSQL
skeletons are buried.  But, I don't know Cosmos that well, only having done two
smallish projects with it where I didn't get to stress test it.

I do know something is amiss with Cosmos and how I have seen it used on large
projects, and I decided to try to suss it out with ChatGPT. What follows is my
discussion with ChatGPT with my commentary.










{{< imageWithCaption
src="/images/microsoft-cosmos-flack.png"
alt="Azure Cosmos DB is the world's most scalable AI database. icon of sparkly cloudy planet.  Serverless or Provisioned Throughput.  Automatic sharding/provisioning.  High elasticity with instant autoscale.  Low latency, real-time data transactions.  Mission critical reliability (99.999%).  5 levels of multitenancy.  Built-in vector index and search with DiskANN"
caption="Azure Cosmos DB Flack Messaging" >}}

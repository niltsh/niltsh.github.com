---
layout: post
title: "Introduction of iOS and OS X Network Programming Cookbook"
date: 2014-04-13 17:16
comments: false
categories: network OSX iOS 
---

Recently I got a chance to work on a new project which needs utilize the network, such as HTTP protocol, socket programming, etc.

I was a newbie about this topic, so I found myself a book as the guide book for network programming. It is [“iOS and OS X Network Programming Cookbook”](http://goo.gl/hRDLHj).

![book title](http://dgdsbygo8mp3h.cloudfront.net/sites/default/files/imagecache/productview_larger/8085OT_Cookbook_cover.jpg)

As the title indicated, it is a cookbook for someone like me, who has the programming basis on OSX/iOS, and wants to take a quick look at the network programming especially.

This book explained how to program in OSX/iOS at several levels, from the lowest BSD socket layer to the highest AFNetworking library.

BSD socket library provides you the lowest level and most flexibility, however this also means you have to everything yourself. If you just want to use the latest HTTP technology, such as json, plist data transferring and analysis, there are better choices on OSX/iOS, such as AFNetworking, MKNetworkKit. These libraries are purely Objective-C, modern designed, and should be much easier to use than BSD library’s C API.

There are also several sample code shown in the book, basically a web server and client implementation is demonstrated, by utilizing each level of technology. These sample code self-explained how to implement the network programming, also help the readers to understand which technology should be their best choice.
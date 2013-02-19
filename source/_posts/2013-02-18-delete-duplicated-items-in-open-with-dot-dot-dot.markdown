---
layout: post
title: "Delete duplicated items in Open With..."
date: 2013-02-18 19:18
comments: true
categories: MPlayerX Mac
---

Some users said they have duplicated menu items in their "Open With ..." of the contextual menu, looks like

{% img /images/duplicated_items_contextual_menu.png 400 300 Snapshot %}

<!-- more -->

**First**, please check whether you have downloaded multiple copies of the same application, [Spotlight](http://support.apple.com/kb/ht2531) is your good assistant.

If there is only one copy, the following command would fix it.

{% codeblock lang:bash In Terminal.app, the command looks like %}
/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user
{% endcodeblock %}

With this command, the database of **LaunchService** will be rebuilt, and duplicated entries in "Open With..." should disappear.
